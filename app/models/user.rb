class User < ActiveRecord::Base

  has_secure_password

  enum status: [:inactive, :active]

  has_many :stations
  has_many :measurements

  validates :name, presence: true, length: { maximum: 64 }
  validates :email, presence: true

  before_create :activate

  private

  def activate
    self.status = :active
  end

end
