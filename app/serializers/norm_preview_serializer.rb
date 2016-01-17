class NormPreviewSerializer < ActiveModel::Serializer

  attributes :value, :level, :interval

  belongs_to :subject, serializer: SubjectPreviewSerializer

end
