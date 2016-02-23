namespace :send_emails do
  desc "TODO"
  task weekly_update: :environment do
    if Date.today.wday == 1
      Team.joins(:dancers).group('teams.id').each do |team|
        Newsletter.weekly_mailer(team).deliver_now
      end
    end
  end
end
