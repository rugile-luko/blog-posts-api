FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    user_id nil
    post_id nil
  end
end