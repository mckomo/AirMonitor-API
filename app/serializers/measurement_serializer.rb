# frozen_string_literal: true
class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :value, :time, :source, :created_at

  belongs_to :channel, serializer: ChannelSerializer
  belongs_to :user, serializer: UserPreviewSerializer, key: 'creator'
end
