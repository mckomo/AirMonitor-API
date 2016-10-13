# frozen_string_literal: true
class NormSerializer < ActiveModel::Serializer
  attributes :value, :interval, :level

  belongs_to :subject, serializer: SubjectPreviewSerializer
  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'
end
