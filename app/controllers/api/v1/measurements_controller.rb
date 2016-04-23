module API::V1
  class MeasurementsController < API::EndpointController

    include Authenticable

    before_action :authenticate!, only: [:create]

    before_action :set_channel, only: [:index, :create]
    before_action :set_measurement, only: [:show]

    # GET /api/v1/measurements/:id
    def show
      render json: @measurement
    end

    # GET /api/v1/channels/:code/measurements
    def index
      measurements = @channel.measurements

      render json: measurements, each_serializer: MeasurementPreviewSerializer
    end

    # POST /api/v1/channels/:code/measurements
    def create

      @measurement = Measurement.new(measurement_params)

      if @measurement.save
        render json: @measurement,
               status: :created,
               location: api_v1_measurement_path(@measurement.id)
      else
        render json: @measurement.errors,
               status: :unprocessable_entity
      end

    end

    private

    def set_measurement
      @measurement = Measurement.find(params[:id])
    end

    def set_channel
      @channel = Channel.find_by_code!(params[:channel_code])
    end

    # Only allow a trusted parameter "white list" through.
    def measurement_params
      params.require(:measurement)
          .permit(:value, :time, :source)
          .merge(association_params)
    end

    def association_params
      {channel: @channel, user: request.user}
    end

  end
end
