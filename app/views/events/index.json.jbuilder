json.array!(@events) do |event|
  json.extract! event, :id, :title, :text, :place, :date_time
  json.url event_url(event, format: :json)
end
