class Subject < ActiveRecord::Base

  has_many :norms, primary_key: 'code', foreign_key: 'subject_code'

end
