puts "* Deleting Seeds *"
Order.destroy_all
Lesson.destroy_all
Category.destroy_all
Document.destroy_all
Identity.destroy_all
Tutor.destroy_all
Student.destroy_all

# C A T E G O R Y //////////////////////////////////////////////////////////////
puts "Creating Categories"

FIXED_CAT = %w(Mathematics History Art Chemistry Physics Biology Computer Economics)

FIXED_CAT.each do | category |
  cat = Category.create(name: category, description: Faker::Lorem.paragraph)
end

# TEST - ADMIN Tutor + Student /////////////////////////////////////////////////
puts "Tutor: tutor@test.com => A D M I N"

Tutor.create(
  email: "tutor@test.com",
  password: "tutor@test.com",
  first_name: "Mario",
  last_name: "Tutorelli",
  phone: Faker::PhoneNumber.cell_phone,
  bio: Faker::Lorem.sentence,
  birthdate: Faker::Date.birthday(25, 65),
  level: 2,
  admin: true,
  photo: "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1..99)}.jpg",
)
Identity.create!(
  name: "Mario Tutorelli",
  document_type: 0,
  document_number: "1234567890",
  expired: "12/12/2024",
  nationality: "Italy",
  tutor: Tutor.first,
)
Document.create!(
  name: "Trigonometry Degree",
  institute: "University of Cambridge",
  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  qualification: "Mathematics and Algebra",
  achieved: "02/11/1985",
  lvl: 2,
  years_of_experience: 4,
  tutor: Tutor.first,
)

Student.create(
  email: "student@test.com",
  password: "student@test.com",
  first_name: "Luca",
  last_name: "Studentini",
  phone: Faker::PhoneNumber.cell_phone,
  bio: Faker::Lorem.sentence,
  birthdate: Faker::Date.birthday(12, 30),
  photo: "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1..99)}.jpg",
)

# U S E R S - Student Tutor ////////////////////////////////////////////////////
puts "Creating Users"
20.times do

  Tutor.create(
    email: Faker::Internet.unique.email,
    password: '1234567',
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    bio: Faker::Lorem.sentence,
    birthdate: Faker::Date.birthday(25, 65),
    photo: "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1..99)}.jpg",
    level: rand(1..3),
  )

  Student.create(
    email: Faker::Internet.unique.email,
    password: '1234567',
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    bio: Faker::Lorem.sentence,
    birthdate: Faker::Date.birthday(12, 30),
    photo: "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1..99)}.jpg",
  )

end

# L E S S O N //////////////////////////////////////////////////////////////////
puts "Finally creating the Lessons (with and without Tutor)"

15.times do # WITH TUTOR - status: :scheduled OR :canceled
  cat = Category.find(rand(Category.first.id..Category.last.id))
  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  stu = Student.find(rand(Student.first.id..Student.last.id))

  less = Lesson.new(
    title: "#{['Hello, I need help with ','Looking for help with ','Need help with ','Someone can explain ','Please helps with '].sample} #{Faker::BossaNova.song}",
    request: Faker::Lorem.paragraph,
    date: Faker::Date.forward(300),
    time: Time.now ,
    location: Faker::Address.full_address,
    status: rand(1..2),
    tutor_lvl: rand(1..3),
    price_cents: rand(2000..8000),
    notes: Faker::StarWars.quote,
    tutor_notes: Faker::Lorem.paragraph
  )

  less.category = cat
  less.tutor = tut
  less.student = stu

  less.save
end

30.times do # NO TUTOR - status: requested
  cat = Category.find(rand(Category.first.id..Category.last.id))
  stu = Student.find(rand(Student.first.id..Student.last.id))

  less = Lesson.new(
    title: "#{['Hello, I need help with ','Looking for help with ','Need help with ','Someone can explain ','Please helps with '].sample} #{Faker::BossaNova.song}",
    request: Faker::Lorem.paragraph,
    date: Faker::Date.forward(300),
    time: Time.now ,
    location: Faker::Address.full_address,
    status: 0,
    tutor_lvl: rand(1..3),
    notes: Faker::StarWars.quote,
  )

  less.category = cat
  less.student = stu

  less.save
end

# R E V I E W  /////////////////////////////////////////////////////////////////
100.times do
  r = Review.new(
    title: Faker::Lorem.sentence,
    content: Faker::Community.quotes,
    rating: rand(1..5),
  )

  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  r.tutor = tut

  stu = Student.find(rand(Student.first.id..Student.last.id))
  r.student = stu

  r.save!
end

Tutor.all.each do |tutor|
  a = Category.find(rand(Category.first.id..Category.last.id))
  b = Category.find(rand(Category.first.id..Category.last.id))
  c = Category.find(rand(Category.first.id..Category.last.id))

  tutor.categories << a
  tutor.categories << b
  tutor.categories << c

  tutor.categories = tutor.categories.uniq

  tutor.save!
end

# "https://randomuser.me/api/portraits/men/1.jpg"

# "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1..99)}.jpg"
