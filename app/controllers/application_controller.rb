class ApplicationController < ActionController::API

  rescue_from RailsJwt::Errors::UnauthorizedAccessError, with: :render_error

  def render_error(error)
    render json: error, serializer: ErrorSerializer, status: :unauthorized
  end

end
