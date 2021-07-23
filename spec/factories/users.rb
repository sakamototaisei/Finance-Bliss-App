FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 20) }
    introduction { Faker::Lorem.characters(number: 160) }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end