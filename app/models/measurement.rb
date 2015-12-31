class Measurement < ActiveRecord::Base

  default_scope { order('time DESC') }

  belongs_to :subject
  belongs_to :station
  belongs_to :user

  has_many :norms, through: :subject

  scope :latest, -> { take(6) } # TODO

  validates :value,   presence: true, numericality: true
  validates :time,    presence: true
  validates :source,  length: { maximum: 256 }, allow_nil: true
  validates :subject, presence: true
  validates :station, presence: true
  validates :user,    presence: true

end
