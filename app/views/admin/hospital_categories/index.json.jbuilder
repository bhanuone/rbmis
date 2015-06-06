json.array!(@hospital_categories) do |hospital_category|
  json.extract! hospital_category, :id, :name
  json.url country_url(hospital_category, format: :json)
end
