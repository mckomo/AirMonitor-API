module API::V1
  class MeasurementsController < ApplicationController

    before_action :set_measurement, only: [:show, :update, :destroy]

    # GET /stations/:station_id/measurements
    def index
      @measurements = Measurement.includes(:user, :subject, :norms).where(station_id: params[:station_id], time: Time.now.all_week)

      render json: @measurements, each_serializer: MeasurementPreviewSerializer
    end

    # GET /measurements/:id
    def show
      render json: @measurement
    end

    # # POST /measurements
    # def create
    #   @measurement = Measurement.new(measurement_params)
    #
    #   if @measurement.save
    #     render json: @measurement, status: :created, location: @measurement
    #   else
    #     render json: @measurement.errors, status: :unprocessable_entity
    #   end
    # end
    #
    # # PATCH/PUT /measurements/1
    # def update
    #   if @measurement.update(measurement_params)
    #     render json: @measurement
    #   else
    #     render json: @measurement.errors, status: :unprocessable_entity
    #   end
    # end
    #
    # # DELETE /measurements/1
    # def destroy
    #   @measurement.destroy
    # end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement).permit(:time, :source)
    end

  end
end
