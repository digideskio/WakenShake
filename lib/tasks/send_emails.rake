namespace :send_emails do
  desc "TODO"
  task weekly_update: :environment do
    if Date.today.in_time_zone('Eastern Time (US & Canada)').wday == 1
      Team.joins(:dancers).group('teams.id').each do |team|
        Newsletter.weekly_mailer(team).deliver_now
      end
    end
  end
  task test_weekly_update: :environment do
    puts "Testing emails"
    if Date.today.in_time_zone('Eastern Time (US & Canada)').wday == 1
      Team.joins(:dancers).group('teams.id').each do |team|
        puts "Queuing up emails"
        Newsletter.test_weekly_mailer(team).deliver_now
      end
    end
  end
end
