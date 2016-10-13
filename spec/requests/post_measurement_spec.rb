# frozen_string_literal: true
require 'rails_helper'
require 'helpers/requests'
require 'shared/requests'

RSpec.describe 'Measurements', type: :request do
  describe 'POST /api/v1/channel/:code/measurements' do
    let(:channel) { create(:channel) }
    let(:params) { measurement_params }

    let(:resource_url) { api_v1_measurement_url(body['id']) }

    before do
      post api_v1_channel_measurements_path(channel.code),
           params: params,
           headers: auth_header
    end

    it_behaves_like 'a created response'
    it_behaves_like 'a single resource'

    it { expect(body).to include('id') }

    context 'without an authentication header' do
      before { post api_v1_channel_measurements_path(channel.code), params: params }

      it { expect(response).to have_http_status(401) }
    end
  end
end

def measurement_params
  {
    measurement: {
      value: 100.0,
      time: Time.now,
      source: 'Test source'
    }
  }
end
