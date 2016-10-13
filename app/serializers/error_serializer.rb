# frozen_string_literal: true
class ErrorSerializer < ActiveModel::Serializer
  attributes :message, :code
end
