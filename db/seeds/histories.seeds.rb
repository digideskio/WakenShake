History.where(
  theme: "X Out Cancer",
  year: DateTime.strptime("03/21/2015 17:00", "%m/%d/%Y %H:%M"),
).first_or_create!(
  overview: "On March 21, 2015 from noon to midnight, over 1,300 students were on their feet dancing and taking a stand against cancer. It was Wake ‘N Shake’s 10th Anniversary, and the event was a huge celebration of how much Wake ‘N Shake has grown over the past 10 years. The gym looked a little different than in years past. The lights were off and the stage ran along a different wall, but the same excitement, energy, and love for Wake ‘N Shake remained present throughout the entire 12-hours. During the day and night, students listened to inspiring speeches from each of the ten “Team Champions,” and at the end of the night, heard a moving testimonial from cancer survivor and Wake Forest senior, David Edwards. In between speakers, students danced with Zumba and Body Combat instructors, learned the tango and how to swing dance, and danced with glowsticks during the “Rave Hour.” Finally, at the end of the night, students celebrated with the day’s fundraising total of $164,157!",
  amount_raised: "$164,157",
  num_of_dancers: "Over 1,300",
  photo: open("#{Rails.root}/db/seeds/data/history_images/wns_2015.png")
)
History.where(
  theme: "Superheroes",
  year: DateTime.strptime("03/22/2014 17:00", "%m/%d/%Y %H:%M"),
).first_or_create!(
  overview: "The ninth annual Wake ‘N Shake was held on March 22, 2014. In total, 1,350 dancers came together to raise over $182,056.00 for the Brian Piccolo Cancer Research Fund. Our theme was “Superheroes” and dancers were divided into one of six teams: Batman, Captain America, the Flash, Green Lantern, Ironman, and Spiderman.",
  amount_raised: "$182,056",
  num_of_dancers: "1,350",
  photo: open("#{Rails.root}/db/seeds/data/history_images/wns_2014.png")
)
History.where(
  theme: "Tackling Cancer",
  year: DateTime.strptime("03/24/2013 17:00", "%m/%d/%Y %H:%M"),
).first_or_create!(
  overview: "The eighth annual Wake ‘N Shake was held on March 23, 2013. It was a great success, a special motivation, and a wonderful memory for many students. Over 1,300 students participated throughout the day, and there were nearly 400 students on their feet for 12 hours. The dancing, game playing, group singing, team competitions, cancer survivor testimonies, pep talks from Coach Grobe and Provost Kersh and much more kept us going strong until 12 midnight. The closing ceremony was a fun and powerful experience for all who stayed until the end. And one of the many miracles from Wake ‘N Shake was that over $125,700 was raised for the Brian Piccolo Cancer Fund to find a cure for this terrible disease. In total, 1,302 dancers participated and the event raised $146,419.55. The theme was “NFL” and our dancers were divided into six teams: Baltimore Ravens, Carolina Panthers, Chicago Bears, Dallas Cowboys, New York Giants, and Washington Redskins.",
  amount_raised: "$125,722",
  num_of_dancers: "1,300",
  photo: open("#{Rails.root}/db/seeds/data/history_images/wns_2013.png")
)
History.where(
  theme: "Oh, The Places We’ll Go",
  year: DateTime.strptime("03/24/2012 17:00", "%m/%d/%Y %H:%M"),
).first_or_create!(
  overview: "The seventh annual Wake ‘N Shake was held on March 24, 2012.  In total, over 1,050 dancers participated and the event raised $110,000. The theme was “Dr. Seuss” and our dancers were divided into six teams based on his most popular characters: Cat in the Hat, Horton, Grinch, Lorax, Sam I Am, and Sneetches.",
  amount_raised: "$110,000",
  num_of_dancers: "1,050",
  photo: open("#{Rails.root}/db/seeds/data/history_images/wns_2012.png")
)
