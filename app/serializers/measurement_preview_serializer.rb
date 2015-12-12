class MeasurementPreviewSerializer < ActiveModel::Serializer

  attributes :id, :value, :time, :source, :subject, :norm

  belongs_to :subject, serializer: SubjectPreviewSerializer
  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'

  def subject
    SubjectPreviewSerializer.new(object.subject).attributes
  end

  def norm
    NormPreviewSerializer.new(object.norms.take).attributes
  end

end
