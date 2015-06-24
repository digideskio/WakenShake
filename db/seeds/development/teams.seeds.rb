team_names = [
  "S",
  "A",
  "E",
  "K",
  "TR",
  "Z",
  "B"
]

15.times do
  Team.where(
    name: team_names.sample(rand(3..4)).join("")
  ).first_or_create!(
    count: rand(13..14)
  )
end
