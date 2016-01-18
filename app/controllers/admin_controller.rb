class AdminController < ApplicationController
  def index
    @dancers_count = Dancer.count
    @active_teams = Team.joins(:dancers).count
    @amount_raised = Donation.sum(:amount)
  end
end
