class RegistrationReminder < ApplicationMailer

  def remind_dancer(dancer)
    @dancer = dancer
    mail to: @dancer.email, subject: "Pay your Wake 'N Shake registration fee"
  end
end
