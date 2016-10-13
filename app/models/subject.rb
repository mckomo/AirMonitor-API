# frozen_string_literal: true
class Subject < ActiveRecord::Base
  belongs_to :user

  has_many :norms
  has_many :channels

  validates :code,  presence: true, length: { maximum: 16 }
  validates :name,  presence: true, length: { maximum: 32 }
  validates :unit,  presence: true, length: { maximum: 16 }
  validates :user,  presence: true
end
