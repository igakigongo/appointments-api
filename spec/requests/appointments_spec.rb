require 'rails_helper'

RSpec.describe 'Appointments API', type: :request do
  # add appointments owner
  let(:user) { create(:user) }
  let!(:appointments) { create_list(:appointment, 10, user_id: user.id) }
  let(:appointment_id) { appointments.first.id }

  # add valid headers to authorize requests
  let(:headers) { valid_headers }

  # create a valid appointment
  let(:today) { Date.today }
  let(:start_date) { DateTime.new(today.year, today.month, today.day, 8) + 1.week }
  let(:end_date) { start_date + 1.hour }
  let(:valid_attributes) do
    {
      end_date: end_date,
      reason: 'Dentist Review',
      start_date: start_date,
      user_id: user.id
    }
  end
  let(:appointment_json) { valid_attributes.to_json }

  # Test suite for GET /appointments
  describe 'GET /appointments' do
    before { get '/appointments', params: {}, headers: headers }

    it 'returns appointments' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns http status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /appointments/:id' do
    before { get "/appointments/#{appointment_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the appointment' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(appointment_id)
      end

      it 'returns http status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:appointment_id) { 2000 }

      it 'returns a not found message' do
        expect(response.body).to match(/couldn't find appointment/i)
      end

      it 'returns http status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'POST /appointments' do
    context 'when a slot is available' do
      before do 
        post '/appointments', params: appointment_json, headers: headers
      end

      it 'creates an appointment' do
        expect(json['reason']).to match(/dentist review/i)
      end

      it 'returns http status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when a slot is booked' do
      before do
        Appointment.create(valid_attributes)
        post '/appointments', params: appointment_json, headers: headers
      end

      it 'does not create the appointment' do
        expect(json['message']).to match(/the slot is already taken/i)
      end

      it 'returns http status code 422' do
        expect(response).to have_http_status(422)
      end
    end
  end

  describe 'PUT /appointments/:id' do
    let(:appointment_to_update) {Appointment.create(valid_attributes)}

    before do
      valid_attributes[:reason] = 'Updated dentist review' 
      put "/appointments/#{appointment_to_update.id}", params: appointment_json, headers: headers
    end

    it 'updates the record' do
      expect(response.body).to be_empty
      expect(appointment_to_update.reason).to match(/updated dentist review/i)
    end

    it 'returns http status code 204' do
      expect(response).to have_http_status(204)
    end
  end

  describe 'DELETE /appointments/:id' do
    before { delete "/appointments/#{appointment_id}", params: {}, headers: headers }

    it 'removes the appointment' do
      expect {Appointment.find(appointment_id)}.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
