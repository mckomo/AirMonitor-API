require 'rails_helper'
require 'helpers/requests'
require 'shared/requests'

RSpec.describe 'Measurements', :type => :request do

  describe 'GET /api/v1/measurements/:id' do

    let(:measurement) { create(:measurement) }

    before { get api_v1_measurement_path(measurement.id) }

    it_behaves_like 'a successful response'
    it_behaves_like 'a single resource'

  end

end