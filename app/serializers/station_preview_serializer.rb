# frozen_string_literal: true
class StationPreviewSerializer < ActiveModel::Serializer
  attributes :code, :name, :latitude, :longitude
end
