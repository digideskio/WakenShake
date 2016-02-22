# Preview all emails at http://localhost:3000/rails/mailers/newsletter
class NewsletterPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/newsletter/weekly-mailer
  def weekly-mailer
    Newsletter.weekly-mailer
  end

end
