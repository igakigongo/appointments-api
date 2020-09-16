require 'rails_helper'

RSpec.describe User, type: :model do
  # association tests
  it { should have_many(:appointments) } 

  # validation tests
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
end
