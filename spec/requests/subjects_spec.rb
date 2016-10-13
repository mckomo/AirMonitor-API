# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Subjects', type: :request do
  describe 'GET /api/v1/subjects' do
    let!(:subjects) { create_list(:subject, 5) }

    before { get api_v1_subjects_path }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'returns an array' do
      expect(JSON.parse(response.body)).to be_a(Array)
    end

    it 'contains all subjects' do
      expect(JSON.parse(response.body).count).to be(subjects.count)
    end
  end
end
