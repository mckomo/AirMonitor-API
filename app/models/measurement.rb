class Measurement < ActiveRecord::Base

  default_scope { order('time DESC') }

  belongs_to :subject
  belongs_to :station
  belongs_to :user
  has_many :norms, through: :subject

  scope :latest, -> { take(6) } # TODO

end
