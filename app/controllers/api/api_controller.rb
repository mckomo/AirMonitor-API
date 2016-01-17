module API
  class ApiController < ActionController::API

    def self.errors_to_rescue
       [Errors::UnauthorizedAccessError,
        ActiveRecord::RecordNotFound,
        ActionController::RoutingError]
    end

    rescue_from *errors_to_rescue, with: :render_error

    def render_error(error)
      render json: error,
             adapter: :json,
             root: 'error',
             serializer: ErrorSerializer,
             status: Errors.http_status_for(error)
    end

  end
end
