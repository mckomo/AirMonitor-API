class Norm < ActiveRecord::Base

  enum level: [:permissible, :warning, :alarming]

  default_scope { order('interval::interval, level') }

  belongs_to :subject
  belongs_to :user

  validates :value,     presence: true, numericality: true
  validates :level,     presence: true, numericality: { only_integer: true }
  validates :interval,  presence: true
  validates :subject,   presence: true
  validates :user,      presence: true

end
