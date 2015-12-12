class NormSerializer < ActiveModel::Serializer

  attributes :value, :interval, :level, :created_at, :updated_at

  belongs_to :subject, key: 'subject'

end
