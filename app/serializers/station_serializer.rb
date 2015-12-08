class StationSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :user
end
