# frozen_string_literal: true
class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :joined_at

  def joined_at
    object.created_at
  end
end
