class Subject < ActiveRecord::Base

  has_many :norms
  belongs_to :user

  validates :code,  presence: true, length: { maximum: 16 }
  validates :name,  presence: true, length: { maximum: 32 }
  validates :unit,  presence: true, length: { maximum: 16 }
  validates :user,  presence: true

end
