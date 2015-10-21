class HomePageController < ApplicationController
  def index
    @top_10_teams = Team.all.order("amount_raised DESC").limit(10)
    @top_10_dancers = Dancer.all.order("amount_raised DESC").limit(10)
  end
end
