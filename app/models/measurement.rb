class Measurement < ActiveRecord::Base

  default_scope { order('time DESC') }

  belongs_to :channel
  belongs_to :user

  validates :value,   presence: true, numericality: true
  validates :time,    presence: true
  validates :source,  presence: true, length: { maximum: 256 }, allow_nil: true
  validates :channel, presence: true
  validates :user,    presence: true

  validates_with EmptyRangeValidator,
                 nothing_of: :time,
                 in_between: 5.minutes,
                 with_scope: [:channel_id]

end


