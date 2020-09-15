require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  # initialize test data
  let!(:appointments) { create_list(:appointment, 10) }
  let(:appointment) { appointments.first.id }

  # Test suite for GET /appointments
  describe 'GET /appointments' do
    before { get '/appointments' }

    it 'returns appointments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
