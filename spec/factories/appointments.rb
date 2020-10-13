FactoryBot.define do
  factory :appointment do
    end_date { Time.now }
    reason { Faker::Lorem.word }
    start_date { Time.now }
  end
end
