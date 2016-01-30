puts "Seeding teams..."

require 'csv'

csv_text = File.read("#{Rails.root}/db/seeds/data/teams.csv")
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  Team.where(row.to_hash).first_or_create!
end
