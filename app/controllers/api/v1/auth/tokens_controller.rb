module API::V1::Auth
  class TokensController < ApplicationController

    def create
      authorize!
      render json: { token: RailsJwt::Token.for(user) }, status: :created
    end

    private

    def user
      @user ||= User.find_by(email: auth_params[:email])
    end

    def authorize!
      raise RailsJwt::Errors::UnauthorizedAccessError unless user.try(:authenticate, auth_params[:password])
    end

    # Only allow a trusted parameter "white list" through.
    def auth_params
      params.require(:auth).permit(:email, :password)
    end

  end
end
