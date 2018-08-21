puts "* Deleting Seeds *"
Lesson.destroy_all
Category.destroy_all
Tutor.destroy_all
Student.destroy_all

# U S E R S - Student Tutor ////////////////////////////////////////////////////
puts "Creating users"
20.times do

  Tutor.create(
    email: Faker::Internet.unique.email,
    password: '1234567',
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    bio: Faker::RickAndMorty.quote,
    birthdate: Faker::Date.birthday(25, 65)
  )

  Student.create(
    email: Faker::Internet.unique.email,
    password: '1234567',
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    phone: Faker::PhoneNumber.cell_phone,
    bio: Faker::RickAndMorty.quote,
    birthdate: Faker::Date.birthday(12, 30)
  )

end

# C A T E G O R Y //////////////////////////////////////////////////////////////
puts "Creating categories"

FIXED_CAT = %w(Mathematics History Science Health Art Music Speech Chemistry Physics Biology Languages Computer Business Journalism Photography Economics Sociology Culinary Lifeskills)

FIXED_CAT.each do | category |
  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  cat = Category.new(name: category, description: Faker::Lorem.paragraph)
  cat.tutor_id = tut.id

  cat.save
end
# 20.times do
#   tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
#   cat = Category.new(name: FIXED_CAT.sample, description: Faker::Lorem.paragraph)
#   cat.tutor_id = tut.id

#   cat.save
# end

# L E S S O N //////////////////////////////////////////////////////////////////
puts "Finally creating the lessons (with and without Tutor)"

10.times do # WITH TUTOR - status: :scheduled OR :canceled
  cat = Category.find(rand(Category.first.id..Category.last.id))
  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  stu = Student.find(rand(Student.first.id..Student.last.id))

  less = Lesson.new(
    title: "#{['Need help with ','Someone can explain ','Please helps with '].sample} #{Faker::BossaNova.song}",
    request: Faker::Lorem.paragraph,
    date: Faker::Date.forward(300),
    time: Time.now ,
    location: Faker::Address.full_address,
    status: rand(1..2),
    price_cents: rand(2000..8000),
    notes: Faker::StarWars.quote,
    tutor_notes: Faker::Lorem.paragraph
  )

  less.category = cat
  less.tutor = tut
  less.student = stu

  less.save
end

10.times do # NO TUTOR - status: requested
  cat = Category.find(rand(Category.first.id..Category.last.id))
  stu = Student.find(rand(Student.first.id..Student.last.id))

  less = Lesson.new(
    title: "#{['Need help with ','Someone can explain ','Please helps with '].sample} #{Faker::BossaNova.song}",
    request: Faker::Lorem.paragraph,
    date: Faker::Date.forward(300),
    time: Time.now ,
    location: Faker::Address.full_address,
    status: 0,
    notes: Faker::StarWars.quote,
  )

  less.category = cat
  less.student = stu

  less.save
end

# R E V I E W  /////////////////////////////////////////////////////////////////
200.times do
  r = Review.new(
    title: Faker::Lorem.sentence,
    content: Faker::Community.quotes,
    rating: rand(1..5)
  )

  tut = Tutor.find(rand(Tutor.first.id..Tutor.last.id))
  r.tutor = tut

  r.save!
end
