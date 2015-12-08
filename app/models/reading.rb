class Reading < ActiveRecord::Base

  belongs_to :measurement
  belongs_to :subject, primary_key: 'code', foreign_key: 'subject_code'

end
