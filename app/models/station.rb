class Station < ActiveRecord::Base

  belongs_to :user

  has_many :channels

  validates :name,      presence: true, length: { maximum: 64 }
  validates :code,      presence: true, length: { maximum: 16 }
  validates :latitude,  presence: true, inclusion: { in: -90.0 .. 90.0 }
  validates :longitude, presence: true, inclusion: { in: -180.0 .. 180.0 }
  validates :user,      presence: true

end
