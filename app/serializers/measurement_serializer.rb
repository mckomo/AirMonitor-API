class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :source, :station, :user, :time
end
