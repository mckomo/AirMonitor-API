module API::V1
  class MeasurementsController < API::ApiController

    include Authenticable

    before_action :authenticate!, only: [:create]
    before_action :set_station, only: [:index, :create]
    before_action :set_measurement, only: [:show]

    # GET /api/v1/stations/:station_id/measurements
    def index
      @measurements = @station.measurements
                              .includes(:user, :subject, :norms)
                              .where(time: Time.now.all_week) # TODO

      render json: @measurements, each_serializer: MeasurementPreviewSerializer
    end

    # POST /api/v1/stations/:station_id/measurements
    def create

      @measurement = Measurement.new(measurement_params)

      if @measurement.save
        render json: @measurement, status: :created, location: api_v1_measurement_path(@measurement.id)
      else
        render json: @measurement.errors, status: :unprocessable_entity
      end

    end

    # GET /api/v1/measurements/:id
    def show
      render json: @measurement
    end

    # # DELETE /api/v1/measurements/:id
    # def destroy
    #   @measurement.destroy
    # end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:station_id])
    end


    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement).permit(:value, :time, :source, :subject_id).merge(associations_params)
    end

    def associations_params
      { station_id: @station.id, user_id: @user.id }
    end

  end
end
