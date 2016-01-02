class SubjectSerializer < ActiveModel::Serializer

  attributes :id, :code, :name, :unit, :created_at, :updated_at

  has_many :norms

end
