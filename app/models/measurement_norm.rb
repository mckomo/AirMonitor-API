class MeasurementNorm < ActiveRecord::Base

  enum level: [:permissible, :warning, :alarming]

end
