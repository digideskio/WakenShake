require "stripe"
class FinancialMailer < ApplicationMailer
  default from: "wns@wfu.edu"

  # Sends donation documents to WFU accounting
  def send_stripe_documents

    # Get all Stripe charges
    Stripe.api_key = ENV['STRIPE-TEST-KEY']
    Stripe::Charge.all

    # attachments['charges.csv']
    mail(to: "laddng@gmail.com", subject: "Weekly Documents for WNS")
  end
end
