module API::V1
  class SubjectsController < API::EndpointController

    # GET /api/v1/subjects
    def index
      render json: Subject.includes(:norms).all
    end

  end
end