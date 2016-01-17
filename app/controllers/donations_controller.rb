class DonationsController < ApplicationController

  def create
   
    @charge = Donation.new(donation_params)

    @amount = 2000

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Wake 'N Shake Registration Fee",
      currency: 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def update
    


  end

  def registration_payment
    @new_charge = Donation.create
    # TODO this is where those who register will pay
  end

end
