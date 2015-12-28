module RailsJwt::Errors
  class UnauthorizedAccessError < RuntimeError

    # include ActiveModel::Serialization
    # extend  ActiveModel::Naming
    # extend  ActiveModel::Naming
    include RailsJwt::Serializable

    def status
      401
    end

  end
end