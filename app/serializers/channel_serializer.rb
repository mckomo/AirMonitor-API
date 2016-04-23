class ChannelSerializer < ActiveModel::Serializer

  attributes :code

  belongs_to :subject,  serializer: SubjectPreviewSerializer
  belongs_to :station,  serializer: StationPreviewSerializer
  belongs_to :user,     serializer: UserPreviewSerializer,    key: 'creator'

end
