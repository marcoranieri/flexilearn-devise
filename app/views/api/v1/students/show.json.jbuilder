# app/views/api/v1/tutors/show.json.jbuilder

json.extract! @student, :id, :first_name, :last_name, :email
json.reviews @student.reviews do |review|
  json.extract! review, :id, :title, :content, :tutor if review.student == @student
end
