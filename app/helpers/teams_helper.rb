module TeamsHelper

  # Returns the total amount raised by a team
  def team_amount_raised(team)
    @total = 0
    team.dancers.each do |dancer|
      @total += dancer.charges.sum(:amount)
    end
    @total += team.charges.sum(:amount)
    @total
  end
end
