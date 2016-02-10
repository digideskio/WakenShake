module TeamsHelper

  # Returns the total amount raised by a team
  def team_amount_raised(team)
    @total = 0
    team.dancers.each do |dancer|
      @total += dancer.charges.where(is_donation: true).sum(:amount)
    end
    @total += team.charges.where(is_donation: true).sum(:amount)
    @total
  end
end
