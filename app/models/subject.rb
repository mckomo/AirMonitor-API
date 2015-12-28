class Subject < ActiveRecord::Base

  has_many :norms
  belongs_to :user

end
