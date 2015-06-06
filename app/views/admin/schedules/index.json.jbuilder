json.array!(@schedules) do |schedule|
  json.extract! schedule, :id, :hospital_id, :doctor_id, :sunday_morning_from, :sunday_morning_to, :sunday_noon_from, :sunday_noon_to, :monday_morning_from, :monday_morning_to, :monday_noon_from, :monday_noon_to, :tuesday_morning_from, :tuesday_morning_to, :tuesday_noon_from, :tuesday_noon_to, :wednesday_morning_from, :wednesday_morning_to, :wednesday_noon_from, :wednesday_noon_to, :thursday_morning_from, :thursday_morning_to, :thursday_noon_from, :thursday_noon_to, :friday_morning_from, :friday_morning_to, :friday_noon_from, :friday_noon_to, :saturday_morning_from, :saturday_morning_to, :saturday_noon_from, :saturday_noon_to
  json.url schedule_url(schedule, format: :json)
end
