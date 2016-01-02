module API::V1::Auth
  class TokensController < ApplicationController

    before_action :authenticate!, only: [:create]

    def create
      render json: { token: RailsJwt::Token.for(user) }, status: :created
    end

    private

    def authenticate!
      raise Errors::UnauthorizedAccessError unless user.try(:authenticate, auth_params[:password])
    end

    def user
      @user ||= User.find_by(email: auth_params[:email])
    end

    # Only allow a trusted parameter "white list" through.
    def auth_params
      params.require(:auth).permit(:email, :password)
    end

  end
end
