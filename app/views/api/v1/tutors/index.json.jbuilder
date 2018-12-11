# app/views/api/v1/tutors/index.json.jbuilder

json.array! @tutors do |tutor|
  json.extract! tutor, :id, :first_name, :last_name, :email
end
