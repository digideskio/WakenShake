# years to sample
years = [2019, 2018, 2017, 2016]

# t-shirt sizes to sample
tshirts = ["Small", "Medium", "Large", "X-Large"]

# Seed Data
10.times do
  Dancer.where(
    first_name: 'Nick',
    last_name: 'Ladd',
    email_address: "nick.ladd@wfu.edu",
    year: years.sample,
    gender: 'Male',
    tshirt: tshirts.sample
  ).first_or_create!(
    residence: "Bostwick Hall",
    shift: "First",
    first_time: [true, false].sample,
    hear_about: "Fraternity philanthrophy",
    food_allergies: "Allergic to fish",
    vegetarian: [false, false, false, true].sample,
    contact_name: "John Smith",
    contact_number: "203-504-0543",
    conditional_details: "Need a chair to sit in",
    dancing_for: "Mom",
    bio: "Hey, I'm Nick and I love to dance!"
  )
end
