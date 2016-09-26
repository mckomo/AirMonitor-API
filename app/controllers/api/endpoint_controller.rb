module API

  class EndpointController < ApplicationController

    def self.errors_to_rescue
      [
          AirMonitor::UnauthorizedAccessError,
          ActiveRecord::RecordNotFound,
          ActionController::RoutingError,
          ActionController::ParameterMissing
      ]
    end

    rescue_from(*errors_to_rescue, with: :render_error)

    def render_error(error)
      render json: error,
             adapter: :json,
             root: 'error',
             serializer: ErrorSerializer,
             status: AirMonitor::Error.http_status_for(error)
    end

    def endpoint_not_found
      raise ActionController::RoutingError, 'Endpoint not found'
    end

  end

end
