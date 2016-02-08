class ApplicationMailer < ActionMailer::Base
  # TODO set the default email address here
  default from: %(Wake 'N Shake <wns@wfu.edu>)
  layout 'mailer'
end
