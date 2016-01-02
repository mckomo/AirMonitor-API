class MeasurementPreviewSerializer < ActiveModel::Serializer

  attributes :id, :value, :time, :source, :norms

  belongs_to :subject, serializer: SubjectPreviewSerializer

  def norms
    object.norms.map { |n| NormPreviewSerializer.new(n).attributes }
  end

end
