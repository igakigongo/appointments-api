FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    speciality { Faker::Job.title }
  end
end
