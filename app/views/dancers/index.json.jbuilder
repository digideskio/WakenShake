json.array!(@dancers) do |dancer|
  json.extract! dancer, :id, :first_name, :last_name
  json.url dancer_url(dancer, format: :json)
end
