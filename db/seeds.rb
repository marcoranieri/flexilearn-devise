# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Deleting Seeds..."
Lesson.destroy_all
Category.destroy_all
Tutor.destroy_all
Student.destroy_all

puts "Creating users"
50.times do
  Tutor.create(email: Faker::Internet.unique.email, password: '1234567', first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, phone: Faker::PhoneNumber.cell_phone, bio: Faker::RickAndMorty.quote, birthdate: Faker::Date.birthday(25, 65))
  Student.create(email: Faker::Internet.unique.email, password: '1234567', first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, phone: Faker::PhoneNumber.cell_phone, bio: Faker::RickAndMorty.quote, birthdate: Faker::Date.birthday(12, 30))
end

puts "Creating categories"

FIXED_CAT = %w(Mathematics History Science Health Art Music Speech Chemistry Physics Biology Languages Computer Business Journalism Photography Economics Sociology Culinary Lifeskills)

20.times do
  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  cat = Category.new(name: FIXED_CAT.sample, description: Faker::Lorem.paragraph)
  cat.tutor_id = tut.id

  cat.save
end

puts "Finally creating the lessons"
100.times do

  cat = Category.find(rand(Category.first.id..Category.last.id))
  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  stu = Student.find(rand(Student.first.id..Student.last.id))
  less = Lesson.new(date: Faker::Date.forward(300), time: Time.now , location: Faker::Address.full_address, status: rand(0..2), price_cents: rand(2000..8000), notes: Faker::StarWars.quote)
  less.category = cat
  less.tutor = tut
  less.student = stu

  less.save
end

200.times do
  r = Review.new(title: Faker::Lorem.sentence, content: Faker::Community.quotes, rating: rand(1..5))
  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  r.tutor = tut

  r.save!
end
