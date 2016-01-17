module API
  class EndpointController < ActionController::API

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

    def route_not_found
      raise ActionController::RoutingError, 'Endpoint not found'
    end

  end
end
