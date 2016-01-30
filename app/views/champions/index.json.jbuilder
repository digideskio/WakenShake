json.array!(@champions) do |champion|
  json.extract! champion, :id, :name, :bio, :team
  json.url champion_url(champion, format: :json)
end
