class Measurement < ActiveRecord::Base

  default_scope { order('time DESC') }

  belongs_to :station
  belongs_to :user

  belongs_to :subject, primary_key: 'code', foreign_key: 'subject_code'
  has_many :norms, primary_key: 'subject_code', foreign_key: 'subject_code'

  scope :latest, -> { take(6) } # TODO

end
