module API::V1
  class MeasurementsController < API::EndpointController

    include Authenticable

    before_action :authenticate!, only: [:create]

    before_action :set_channel, only: [:index, :create]
    before_action :set_measurement, only: [:show]

    using FixnumRefinements

    # GET /api/v1/measurements/:id
    def show
      render json: @measurement
    end

    # GET /api/v1/channels/:code/measurements
    def index
      @measurements = @channel.measurements

      paginate json: @measurements,
               each_serializer: MeasurementPreviewSerializer,
               per_page: page_size(default: 24)
    end

    # POST /api/v1/channels/:code/measurements
    def create

      @measurement = Measurement.new(measurement_params)

      if @measurement.save
        render json: @measurement,
               status: :created,
               location: api_v1_measurement_url(@measurement.id)
      else
        render json: @measurement.errors,
               status: :unprocessable_entity
      end

    end

    private

    def set_measurement
      @measurement = Measurement.find_by_id!(params[:id])
    end

    def set_channel
      @channel = Channel.find_by_code!(params[:channel_code])
    end

    def page_size(default:)
      params.fetch(:per_page, default)
          .to_i
          .fit(1 .. 100)
    end

    def measurement_params
      params
          .require(:measurement)
          .permit(:value, :time, :source)
          .merge(association_params)
    end

    def association_params
      {
          user: request.user,
          channel: @channel
      }
    end

  end
end
