module API::V1
  class StationsController < API::EndpointController

    before_action :set_station, only: [:show]

    # GET /stations
    def index
      @stations = Station.includes(channels: [:subject]).all

      render json: @stations, each_serializer: StationPreviewSerializer
    end

    # GET /stations/1
    def show
      render json: @station
    end

    # GET /stations/nearest
    def nearest
      @station = Station
                     .near(location_coordinates, 15, :units => :km)
                     .first

      unless @station
        raise ActiveRecord::RecordNotFound, 'No station found in distance of 15 km'
      end

      render json: @station
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find_by_code!(params[:code])
    end

    def location_coordinates
      params.require(:location).permit(:latitude, :longitude).values
    end

  end
end
