class DonationsController < ApplicationController

  def create
    super

    # TODO Send donation notification email to dancer
    DonationMailer.donation_notification()
  end

end
