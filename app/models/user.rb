class User < ActiveRecord::Base

  has_secure_password

  enum status: [:inactive, :active, :deleted]

  has_many :stations
  has_many :measurements

  validates :name, presence: true, length: { maximum: 64 }
  validates :email, presence: true

  def activate
    self.update(status: :active)
  end

  def delete
    self.update(status: :deleted)
  end

end
