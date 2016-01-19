class AdminController < ApplicationController
  def index
    @dancers_count = Dancer.count
    @active_teams = Team.joins(:dancers).count
    @amount_raised = Charge.where(is_donation: true).sum(:amount)
  end
end
