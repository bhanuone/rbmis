json.array!(@other_facilities) do |other_facility|
  json.extract! other_facility, :id, :name
  json.url other_facility_url(other_facility, format: :json)
end
