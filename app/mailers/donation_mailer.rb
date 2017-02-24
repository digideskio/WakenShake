class DonationMailer < ApplicationMailer

  # Email script to send donation request emails
  def request_a_donation(referral, user)
    @referral = referral
    @dancer = user
    mail(to: @referral.email, subject: "Support my Wake 'N Shake campaign!", from: %(#{@dancer.first_name} #{@dancer.last_name} <#{@dancer.email}>))
  end

  # Donation notification email
  def donation_notification(donation)
    if donation.charged_type == "Dancer"
      @donation = donation
      if Dancer.find_by(email: @donation.email).present?
        @donor = Dancer.find_by(email: @donation.email)
      end
      @dancer = Dancer.find(donation.charged_id).email
      mail(to: @dancer, subject: "You have received a donation!", body: @body)
    end
  end

  def thank_donor(email)
    @email = email
    mail(to: @email, subject: "Thank You for Donating to Wake 'N Shake!", body: @body)

end
