require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context 'validations' do
    it { should validate_presence_of(:doctor_id) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:reason) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:user_id) }
  end
end
