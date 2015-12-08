class Measurement < ActiveRecord::Base

  has_many :readings
  belongs_to :station
  belongs_to :user

end
