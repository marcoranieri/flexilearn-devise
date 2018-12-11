# app/views/api/v1/tutors/show.json.jbuilder

json.extract! @tutor, :id, :first_name, :last_name, :email
json.reviews @tutor.reviews do |review|
  json.extract! review, :id, :title, :content
  json.student do
    json.id review.student_id
    json.first_name review.student.first_name
    json.last_name review.student.last_name
    json.email review.student.email
    json.created_at review.created_at
  end
end
