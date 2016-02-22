namespace :send_emails do
  desc "TODO"
  task weekly_update: :environment do
    if Date.today.wday == 1
      Newsletter.weekly_mailer.deliver_now
    end
  end

  task test_emails: :environment do
    Newsletter.test_emails.deliver_now
  end

end
