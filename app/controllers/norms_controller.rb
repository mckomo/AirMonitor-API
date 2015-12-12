class NormsController < ApplicationController


  # GET /measurements/norms
  def index
    render json: Norm.includes(:subject).all
  end

end
