module API::V1
  class SubjectsController < ApplicationController

    # GET /measurements/subjects
    def index
      render json: Subject.includes(:norms).all
    end

  end
end