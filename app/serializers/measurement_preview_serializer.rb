# frozen_string_literal: true
class MeasurementPreviewSerializer < ActiveModel::Serializer
  attributes :id, :value, :time, :source
end
