# app/views/api/v1/restaurants/index.json.jbuilder

json.array! @lessons do |lesson|
  json.extract! lesson, :id, :student_id, :tutor_id, :title, :request, :date, :location, :status, :created_at
end
