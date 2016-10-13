# frozen_string_literal: true
module API::V1
  class ChannelsController < API::EndpointController
    before_action :set_station, only: [:index]
    before_action :set_channel, only: [:show]

    # GET /stations/:code/channels
    def index
      render json: @station.channels,
             each_serializer: ChannelSerializer
    end

    # GET /channels/:code
    def show
      render json: @channel
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find_by_code!(params[:station_code])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_channel
      @channel = Channel.find_by_code!(params[:code])
    end
  end
end
