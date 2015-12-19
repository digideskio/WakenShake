class ApplicationMailer < ActionMailer::Base
  # TODO set the default email address here
  default from: "wns@wfu.edu"
  layout 'mailer'
end
