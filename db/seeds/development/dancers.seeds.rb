after "teams", "dorms" do
  
  puts "Seeding dancers..."

  # data to sample
  years = ["Freshman", "Sophomore", "Junior", "Senior", "Graduate", "Alumni"]
  tshirts = ["Small", "Medium", "Large", "X-Large"]

  # names
  first_name_array = %w(Nick Joe John Mark Mike Jake Jessie Melissa Ann Caroline Megan Sarah)
  last_name_array = %w(Johnson Smith Root Beshara Thompson Reed Jackson Allen Richards)

  25.times do
    # come up with a random name
    first_name = first_name_array.sample
    last_name = last_name_array.sample

    Dancer.where(
      first_name: first_name,
      last_name: last_name,
      year: years.sample,
      gender: %w('Male' 'Female').sample,
      tshirt: tshirts.sample
    ).first_or_create!(
      residence: Dorm.order("RANDOM()").first,
      email: "#{first_name.downcase}.#{last_name.downcase}.#{rand(1..1000)}@wfu.edu",
      shift: "First",
      team: Team.order("RANDOM()").first,
      password: "demo_pass",
      first_time: [true, false].sample,
      hear_about: "Fraternity philanthrophy",
      food_allergies: "Allergic to fish",
      vegetarian: [false, false, false, true].sample,
      contact_name: "John Smith",
      contact_number: "203-504-0543",
      conditional_details: "Need a chair to sit in",
      dancing_for: "Mom",
      bio: "Hey, I'm Nick and I love to dance!",
      amount_raised: rand(40..999)
    )
  end
end
