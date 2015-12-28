module API::V1
  class NormsController < ApplicationController

    # GET /measurements/norms
    def index
      render json: Norm.includes(:subject).all
    end

  end
end