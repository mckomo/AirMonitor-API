

class Measurement < ActiveRecord::Base

  default_scope { order('time DESC') }

  belongs_to :subject
  belongs_to :station
  belongs_to :user

  has_many :norms, through: :subject

  scope :overlapping, -> (m) { where(time: m.time.around(5.minutes), subject: m.subject, station: m.station) }

  validates :value,   presence: true, numericality: true
  validates :source,  presence: true, length: { maximum: 256 }, allow_nil: true
  validates :subject, presence: true
  validates :station, presence: true
  validates :user,    presence: true
  validates :time,    presence: true

  validates_with Validators::OverlapValidator,
                 attribute: :time,
                 unique_around: 5.minutes,
                 with_scope: [:subject_id, :subject_id]

end


