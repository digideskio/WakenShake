class AdminController < ApplicationController
  def index
    @dancers_count = Dancer.count
    @active_teams = Team.count
  end
end
