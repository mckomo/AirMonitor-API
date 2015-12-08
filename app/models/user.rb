class User < ActiveRecord::Base

  has_secure_password

  has_many :stations
  has_many :measurements

end
