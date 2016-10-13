# frozen_string_literal: true
class User < ActiveRecord::Base
  has_many :stations
  has_many :measurements

  validates :name, presence: true, length: { maximum: 64 }
  validates :email, presence: true
end
