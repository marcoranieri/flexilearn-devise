json.array! @categories do |category|
  json.extract! category, :name, :description
end
