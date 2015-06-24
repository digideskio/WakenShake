class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents
    @amount = 100

    customer = Stripe.Customer.create(
      email: 'example@stripe.com',
      card: params[:stripeToken]
    )

    Stripe.Charge.create(
      customer: customer.id,
      amount: @amount,
      description: "Wake 'N Shake Donation or Registraion",
      currency: 'usd'
    )

  rescue Stripe.CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
