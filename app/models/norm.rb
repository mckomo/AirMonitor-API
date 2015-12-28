class Norm < ActiveRecord::Base

  enum level: [:permissible, :warning, :alarming]

  default_scope { order('interval::interval, level') }

  belongs_to :subject
  belongs_to :user

end
