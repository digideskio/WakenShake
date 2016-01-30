module DancersHelper

  # Returns the total amount raised by a dancer
  def dancer_amount_raised(dancer)
    dancer.charges.where(is_donation: true).sum(:amount)
  end

  def name(dancer)
    "#{dancer.first_name} #{dancer.last_name}"
  end
end
