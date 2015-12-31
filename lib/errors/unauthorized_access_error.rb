module Errors
  class UnauthorizedAccessError < RuntimeError

    include Serializable
    include Identifiable

    identify_by_code 401

  end
end