# Preview all emails at http://localhost:3000/rails/mailers/registration_reminder
class RegistrationReminderPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registration_reminder/remind_dancer
  def remind_dancer
    RegistrationReminder.remind_dancer
  end

end
