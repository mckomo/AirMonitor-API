class NormPreviewSerializer < ActiveModel::Serializer

  attributes :id, :value, :level, :interval

  belongs_to :subject, serializer: SubjectPreviewSerializer

end
