json.array!(@hospitals) do |hospital|
  json.extract! hospital, :id, :name, :area_id, :address, :phone, :bed_capacity, :appointment_charge, :aarogyasri, :verified
  json.url hospital_url(hospital, format: :json)
end
