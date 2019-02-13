# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Louise Lumapas",
email: "louise@gmail.com",
password:              "123456",
password_confirmation: "123456",
admin: true)


Category.create!(title:  "Simple Words",
  description: "lorem ipsum lorem ipsum")

  20.times do |n|
  title  = "Hello there"
  description = "lorem ipsum"
  Category.create!(title: title,
                  description: description)
  end