json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :full_name, :practice_name, :email, :phone, :experience, :verified
  json.url doctor_url(doctor, format: :json)
end
