json.array! @lessons do |lesson|
  json.extract! lesson, :id, :tutor, :student, :category
end
