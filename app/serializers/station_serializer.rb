class StationSerializer < ActiveModel::Serializer

  attributes :id, :code, :name, :latitude, :longitude, :created_at, :updated_at

  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'

end
