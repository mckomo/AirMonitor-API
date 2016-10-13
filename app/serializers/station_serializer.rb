# frozen_string_literal: true
class StationSerializer < ActiveModel::Serializer
  attributes :code, :name, :latitude, :longitude, :created_at, :updated_at

  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'
end
