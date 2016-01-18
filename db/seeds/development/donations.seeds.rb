after "development:dancers" do

  puts "Seeding donations..."

  # names
  first_name_array = %w(Nick Joe John Mark Mike Jake Jessie Melissa Ann Caroline Megan Sarah)

  Dancer.all.each do |dancer|
    rand(7..10).times do
      dancer.charges.where(
        amount: rand(20..100),
        email: "#{first_name_array.sample}@gmail.com",
        is_donation: true
      ).first_or_create!
    end
  end

  Team.all.each do |team|
    rand(10..15).times do
      team.charges.where(
        amount: rand(20..100),
        email: "#{first_name_array.sample}@gmail.com",
        is_donation: true
      ).first_or_create!
    end
  end
end
