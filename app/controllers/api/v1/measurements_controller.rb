module API::V1
  class MeasurementsController < API::EndpointController

    include Authenticable

    before_action :authenticate!, only: [:create]
    before_action :set_subject, only: [:create]
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

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def set_station
      @station = Station.find_by_code!(params[:station_code])
    end

    def set_subject
      @subject = Subject.find_by_code(subject_code_param)
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement)
          .permit(:value, :time, :source)
          .merge(association_params)
    end

    def association_params
      { station: @station, user: @user, subject: @subject }
    end

    def subject_code_param
      params[:measurement].try(:fetch, :subject_code)
    end

  end
end
