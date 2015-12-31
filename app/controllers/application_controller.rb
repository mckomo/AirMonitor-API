class ApplicationController < ActionController::API

  def self.errors_to_rescue
     [Errors::UnauthorizedAccessError,
      ActiveRecord::RecordNotFound,
      ActionController::RoutingError]
  end

  rescue_from *errors_to_rescue, with: :render_error

  def render_error(error)
    render json: error, serializer: ErrorSerializer, status: http_status_for(error.code)
  end

end
