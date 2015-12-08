class Subject < ActiveRecord::Base

  has_many :norms, primary_key: 'code', foreign_key: 'subject_code'
  has_many :readings, primary_key: 'code', foreign_key: 'subject_code'

end
