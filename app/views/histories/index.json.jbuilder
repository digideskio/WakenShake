json.array!(@histories) do |history|
  json.extract! history, :id, :name, :theme, :year, :overview, :amount_raised, :num_of_dancers
  json.url history_url(history, format: :json)
end
