module DancersHelper

  # Returns the total amount raised by a dancer
  def dancer_amount_raised(dancer)
    dancer.charges.sum(:amount)
  end
end
