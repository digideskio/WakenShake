after "development:dancers" do

  puts "Seeding donations..."

  # names
  first_name_array = %w(Nick Joe John Mark Mike Jake Jessie Melissa Ann Caroline Megan Sarah)
  last_name_array = %w(Johnson Smith Root Beshara Thompson Reed Jackson Allen Richards)

  Dancer.all.each do |dancer|
    rand(7..10).times do
      dancer.donations.where(
        amount: rand(20..100),
        name: "#{first_name_array.sample} #{last_name_array.sample}",
        messages: "Good luck at WNS!"
      ).first_or_create!
    end
  end
end