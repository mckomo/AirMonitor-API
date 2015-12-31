class ErrorSerializer < ActiveModel::Serializer

  attributes :message, :exception, :code

end