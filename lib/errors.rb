require 'errors/concerns/serializable'
require 'errors/concerns/identifiable'
require 'errors/extensions'

module Errors; end

def http_status_for(code)
  code
end