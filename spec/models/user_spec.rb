require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:appointments) }
  end

  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }

    it do
      should validate_uniqueness_of(:email).ignoring_case_sensitivity
    end
  end
end
