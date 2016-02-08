# Preview all emails at http://localhost:3000/rails/mailers/admin_mailer
class AdminMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/mass_dancer
  def mass_dancer
    AdminMailer.mass_dancer
  end

  # Preview this email at http://localhost:3000/rails/mailers/admin_mailer/mass_donor
  def mass_donor
    AdminMailer.mass_donor
  end

end
