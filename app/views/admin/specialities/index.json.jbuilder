json.array!(@specialities) do |speciality|
  json.extract! speciality, :id, :name, :description
  json.url speciality_url(speciality, format: :json)
end
