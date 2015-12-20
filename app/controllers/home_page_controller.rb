class HomePageController < ApplicationController
  def index
    @top_10_teams = Team.first(10)
    @top_10_dancers = Dancer.first(10)
    @dancing_for_list = Dancer.all.where("dancing_for != ''").order("RANDOM()").limit(10)
  end
end
