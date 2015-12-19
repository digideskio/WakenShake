class DonationMailer < ApplicationMailer
  default from: "wns@wfu.edu"

  # Email script to send donation request emails
  def request_a_donation(referral)
    @referral = referral
    @url = "http://www.apple.com"
    mail(to: @referral.email, subject: "Support Wake 'N Shake!")
  end
end
