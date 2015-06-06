json.array!(@treatment_categories) do |treatment_category|
  json.extract! treatment_category, :id, :name
  json.url treatment_category_url(treatment_category, format: :json)
end
