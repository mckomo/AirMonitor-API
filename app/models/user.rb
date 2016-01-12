class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable

  has_many :stations
  has_many :measurements

  validates :name, presence: true, length: { maximum: 64 }
  validates :email, presence: true

  alias :active? :confirmed?

end
