require 'rails_helper'

RSpec.describe Doctor, type: :model do
  context 'associations' do
    it { should have_many(:appointments) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:speciality) }
  end
end
