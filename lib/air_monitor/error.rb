module AirMonitor::Error

  def self.http_status_for(error)
    error.code
  end

end

