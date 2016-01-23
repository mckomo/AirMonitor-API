module Validators

  class OverlapValidator < ActiveModel::Validator

    using Refinements::TimeWithZoneRefinements

    def initialize(options)
      super
      @attribute = options[:attribute] || :created_at
      @period = options[:sole_around] || 1.hour
      @scope = options[:with_scope] || {}
    end

    def validate(record)
      @record = record
      @record.errors[:base] << error_message if overlaps?
    end

    def overlaps?
      @record.class.exists?(overlap_query)
    end

    private

    def overlap_query
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
      "Record must have a #{@interval} time interval"
    end

  end

end