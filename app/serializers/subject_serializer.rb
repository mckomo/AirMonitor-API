# frozen_string_literal: true
class SubjectSerializer < ActiveModel::Serializer
  attributes :code, :name, :unit, :created_at, :updated_at

  has_many :norms
end
