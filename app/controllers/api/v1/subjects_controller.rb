module API::V1
  class SubjectsController < API::ApiController

    # GET /api/v1/subjects
    def index
      render json: Subject.includes(:norms).all
    end

  end
end