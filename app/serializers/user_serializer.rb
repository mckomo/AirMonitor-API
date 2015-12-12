class UserSerializer < ActiveModel::Serializer

  attributes :id, :email, :joined_at

  def joined_at
    object.created_at
  end

end
