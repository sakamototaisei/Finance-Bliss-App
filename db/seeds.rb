# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do |n|
  gimei = Gimei.unique.name
  email = "test-#{n+1}@test.com"
  password = "password"

  User.create!(
    name: gimei.romaji,
    email: email,
    password: password,
    password_confirmation: password
    )
end

Genre.create!(name: "資産設計")
Genre.create!(name: "保険")
Genre.create!(name: "資産運用")
Genre.create!(name: "税金")
Genre.create!(name: "不動産")
Genre.create!(name: "相続")
Genre.create!(name: "質問")
Genre.create!(name: "その他")