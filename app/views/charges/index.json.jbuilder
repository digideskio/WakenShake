json.array!(@charges) do |charge|
  json.extract! charge, :id, :amount, :charged_id, :charged_type, :is_registration_fee, :is_donation
  json.url charge_url(charge, format: :json)
end
