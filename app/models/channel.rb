class Channel < ActiveRecord::Base

  has_many :measurements

  belongs_to :station
  belongs_to :subject
  belongs_to :user

  validates :station, presence: true
  validates :subject, presence: true
  validates :user,    presence: true

  before_validation do
    self.code = [station.code, subject.code].join('-')
  end

end
