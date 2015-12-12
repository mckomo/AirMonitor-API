class StationsController < ApplicationController
  before_action :set_station, only: [:show, :update, :destroy]

  # GET /stations
  def index
    @stations = Station.includes(measurements: [:subject, :norms]).all

    render json: @stations, each_serializer: StationPreviewSerializer
  end

  # GET /stations/1
  def show
    render json: @station
  end

  # # POST /stations
  # def create
  #   @station = Station.new(station_params)
  #
  #   if @station.save
  #     render json: @station, status: :created, location: @station
  #   else
  #     render json: @station.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /stations/1
  # def update
  #   if @station.update(station_params)
  #     render json: @station
  #   else
  #     render json: @station.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /stations/1
  # def destroy
  #   @station.destroy
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def station_params
      params.require(:station).permit(:name, :code, :latitude, :longitude)
    end
end
