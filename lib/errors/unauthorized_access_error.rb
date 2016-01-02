module Errors
  class UnauthorizedAccessError < RuntimeError

    include Serializable
    include Identifiable

    identify_by_code 401

    def initialize(message = 'Unauthorized access error')
      super(message)
    end

  end
end