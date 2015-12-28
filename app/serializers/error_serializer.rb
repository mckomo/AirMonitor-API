class ErrorSerializer < ActiveModel::Serializer

  attributes :message, :exception, :status

end