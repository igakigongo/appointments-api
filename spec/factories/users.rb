FactoryBot.define do
  factory :user do
    email { 'foo@bar.com' }
    name { Faker::Name.name }
    password { 'password' }
  end
end
