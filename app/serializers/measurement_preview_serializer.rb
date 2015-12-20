class MeasurementPreviewSerializer < ActiveModel::Serializer

  attributes :id, :value, :time, :source, :norm

  belongs_to :subject, serializer: SubjectPreviewSerializer
  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'

  def norm
    NormPreviewSerializer.new(object.norms.take).attributes
  end

end
