module RailsJwt
  module Authenticable

    extend ActiveSupport::Concern

    def authenticate!
      begin
        @user = User.find subscriber
      rescue ActiveRecord::RecordNotFound
        raise Errors::UnauthorizedAccessError, 'Unauthorized access error'
      end
    end

    private

    def subscriber
      env['jwt.token.payload'].try(:fetch, 'sub', 0)
    end

  end
end