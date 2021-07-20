FactoryBot.define do
  factory :post do
    introduction { Faker::Lorem.characters(number:300) }
    user
  end
end