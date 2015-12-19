class DonationsController < ApplicationController

  # TODO clean up how donation records are created
  def create
    super

    # Send donation notification email to dancer
    DonationMailer.donation_notification()
  end

end
