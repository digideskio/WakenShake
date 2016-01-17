class DonationsController < ApplicationController

  def create
    super

    # TODO Send donation notification email to dancer
    DonationMailer.donation_notification()
  end

  def registration_payment

    # TODO this is where those who register will pay
  end

end
