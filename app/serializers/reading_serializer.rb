class ReadingSerializer < ActiveModel::Serializer
  attributes :id, :subject, :value, :measurement, :user
end
