class DonationMailer < ApplicationMailer

  # Email script to send donation request emails
  def request_a_donation(referral)
    @referral = referral
    @url = "http://www.apple.com"
    mail(to: @referral, subject: "Support Wake 'N Shake!")
  end

  # Donation notification email
  def donation_notification()

    mail(to: "laddng@gmail.com", subject: "You Have Recieved A Donation!")
  end
end
