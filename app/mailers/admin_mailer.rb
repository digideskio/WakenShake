class AdminMailer < ApplicationMailer

  # Sending mass emails to all the dancers
  def mass_dancer(message, subject)
    @addresses = Dancer.pluck(:email)
    @message = message
    @subject = subject
    mail(to: @addresses, subject: @subject)
  end

  # Sending mass emails to all the donors
  def mass_donor(donor, message, subject)
    @message = message
    @subject = subject
    @donor = donor
    mail(to: @donor.email, subject: @subject)
  end
end
