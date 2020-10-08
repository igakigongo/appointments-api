require 'rails_helper'

RSpec.describe 'Doctors API', type: :request do
  # add valid headers to authorize requests
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  # create some test data
  let!(:doctors) { create_list(:doctor, 10) }

  describe 'GET /doctors' do
    before { get '/doctors', params: {}, headers: headers }

    it 'returns doctors' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns http status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
