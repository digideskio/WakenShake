class SendEmailsJob < ActiveJob::Base
  # emails are a low priority job for this web app
  queue_as :low_priority

  def deliver(*args)
    # Send emails
  end
end
