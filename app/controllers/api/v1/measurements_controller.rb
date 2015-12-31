module API::V1
  class MeasurementsController < ApplicationController

    include Authenticable

    before_action :authenticate!, only: [:create]
    before_action :set_station, only: [:index, :create]
    before_action :set_measurement, only: [:show]

    # GET /stations/:station_id/measurements
    def index
      @measurements = @station.measurements
                              .includes(:user, :subject, :norms)
                              .where(time: Time.now.all_week) # TODO

      render json: @measurements, each_serializer: MeasurementPreviewSerializer
    end

    # GET /measurements/:id
    def show
      render json: @measurement
    end

    # POST /measurements
    def create

      @measurement = Measurement.new(measurement_params)

      if @measurement.save
        render json: @measurement, status: :created, location: api_v1_measurement_path(@measurement.id)
      else
        render json: @measurement.errors, status: :unprocessable_entity
      end

    end
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

    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:station_id])
    end


    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement).permit(:value, :time, :source, :subject_id).tap do |p|
        p[:station_id] = @station.id
        p[:user_id] = @user.id
      end
    end

  end
end
