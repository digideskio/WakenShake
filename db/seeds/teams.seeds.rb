puts "Seeding teams..."

teams = []
open(File.expand_path("#{Rails.root}/db/seeds/data/teams.csv", __FILE__)) do |team|
  teams = team.read.each_line.map(&:chomp)
end

teams.each do |team|
  Team.where(
    name: "#{team}",
  ).first_or_create(
    amount_raised: "$0"
  )
end
