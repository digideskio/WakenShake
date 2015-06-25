json.array!(@teams) do |team|
  json.extract! team, :id, :name, :amount_raised
  json.url team_url(team, format: :json)
end
