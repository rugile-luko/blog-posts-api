FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.sentence }

    trait :with_user do
      user_id 1
    end
  end
end
