# frozen_string_literal: true
module API::V1
  class NormsController < API::EndpointController
    # GET /api/v1/norms
    def index
      @norms = Norm.includes(:subject).all

      render json: @norms, each_serializer: NormSerializer
    end

    private

    def norms
      Norm.includes(:subject).all
    end
  end
end
