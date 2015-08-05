class AdminController < ApplicationController
  def index
    @dancers_count = Dancer.count
    @amount_raised = 0
    Dancer.find_each do |dancer|
      @amount_raised += dancer.amount_raised
    end
    @active_teams = Team.count
  end
end
