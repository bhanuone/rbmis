json.array!(@states) do |state|
  json.extract! state, :id, :name, :country_id
end
