json.array!(@diagnostic_facilities) do |diagnostic_facility|
  json.extract! diagnostic_facility, :id, :name
  json.url diagnostic_facility_url(diagnostic_facility, format: :json)
end
