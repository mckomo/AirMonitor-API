# frozen_string_literal: true
require 'rails_helper'
require 'helpers/requests'
require 'shared/requests'

RSpec.describe 'Measurements', type: :request do
  describe 'GET /api/v1/channels/:code/measurements' do
    let(:channel) { create(:channel_with_measurements) }
    let(:pagination) { Hash.new }

    before { get api_v1_channel_measurements_path(channel.code, pagination) }

    it_behaves_like 'a successful response'
    it_behaves_like 'a listable resource'
    it_behaves_like 'a paginable resource'

    it { expect(body.count).to eq(24) }

    it { expect(body).to all include('value') }
    it { expect(body).to all include('time') }

    it { expect(body).to eq body.sort_desc_by('time') }
  end
end
