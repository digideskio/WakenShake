json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :name, :link
  json.url sponsor_url(sponsor, format: :json)
end
