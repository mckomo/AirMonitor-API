module Validators

  class TimeSlotValidator < ActiveModel::Validator

    using Refinements::TimeWithZoneRefinements

    def initialize(options)
      super
      @attribute = options[:nothing_of] || :created_at
      @period = options[:in_between] || 1.hour
      @scope = options[:with_scope] || {}
    end

    def validate(record)
      @record = record
      @record.errors[:base] << error_message if time_slot_nonempty?
    end

    def time_slot_nonempty?
      @record.class.exists?(timeslot_query)
    end

    private

    def timeslot_query
      { @attribute => time_range }.merge(scope_query)
    end

    def time_range
      value_of(@attribute).around(@period)
    end

    def scope_query
      @scope.map(&:to_sym)
          .map { |a| [a, value_of(a)] }
          .to_h
    end

    def value_of(attribute)
      @record.send(attribute)
    end

    def error_message
      "There are other records in #{@time_range} time slot"
    end

  end

end