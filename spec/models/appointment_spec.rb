require 'rails_helper'

RSpec.describe Appointment, type: :model do
  # validation tests
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:reason) }
  it { should validate_presence_of(:start_date) }
end
