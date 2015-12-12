class MeasurementSerializer < ActiveModel::Serializer

  attributes :id, :value, :time, :source, :created_at

  has_many :norms, each_serializer: NormPreviewSerializer

  belongs_to :subject, serializer: SubjectPreviewSerializer
  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'

end
