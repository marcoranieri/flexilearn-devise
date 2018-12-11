# app/views/api/v1/students/index.json.jbuilder

json.array! @students do |student|
  json.extract! student, :id, :first_name, :last_name, :email
end
