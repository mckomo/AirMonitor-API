class Norm < ActiveRecord::Base

  enum level: [:permissible, :warning, :alarming]

  default_scope { order('interval::interval') }

  belongs_to :subject, primary_key: 'code', foreign_key: 'subject_code'

end
