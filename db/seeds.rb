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

15.times do
  title = Faker::Name.title
  description = Faker::Lorem.sentence
  cate = Category.create! title: title, description: description

  10.times do
    word = Category.all.sample.words.build word: Faker::Lorem.word
    word.choices = [
      Choice.new(content: Faker::Lorem.word, correct: true),
      Choice.new(content: Faker::Lorem.word, correct: false),
      Choice.new(content: Faker::Lorem.word, correct: false)
    ].shuffle
    word.save!
  end
end
