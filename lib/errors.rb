require 'errors/concerns/serializable'
require 'errors/concerns/identifiable'
require 'errors/extensions'

module Errors

  class << self

    def http_status_for(error)
      error.code
    end

  end

end

