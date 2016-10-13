# frozen_string_literal: true
class EmptyRangeValidator < ActiveModel::Validator
  attr_reader :attribute, :range_radius, :scope

  def initialize(options)
    super
    @attribute = options[:nothing_of] || :created_at
    @range_radius = options[:in_between] || 1.hour
    @scope = options[:with_scope] || {}
  end

  def validate(record)
    @record = record

    @record.errors[@attribute] << error_message if records_in_range?
  end

  def records_in_range?
    repository.exists?(records_in_range_query)
  end

  private

  def range
    value_of(attribute) - range_radius..value_of(attribute) + range_radius
  end

  def records_in_range_query
    { attribute => range }.merge(scope_query)
  end

  def scope_query
    @scope.map(&:to_sym)
          .map { |a| [a, value_of(a)] }
          .to_h
  end

  def value_of(attribute)
    @record.send(attribute)
  end

  def repository
    @record.class
  end

  def error_message
    "There are other records in #{range} range"
  end
end
