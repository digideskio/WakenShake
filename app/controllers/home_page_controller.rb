class HomePageController < ApplicationController
  def index
    @top_10_teams = Team.joins(:charges).where('charges.is_donation=true').select('teams.id, name, sum(charges.amount) as total_raised').group('teams.id').order('total_raised desc').limit(10)
    @top_10_dancers = Dancer.joins(:charges).where('charges.is_donation=true').select('dancers.id, first_name, last_name, sum(charges.amount) as total_raised').group('dancers.id').order('total_raised desc').limit(10)
    @dancing_for_list = Dancer.all.where("dancing_for != ''").order("RANDOM()").limit(10)
    @events = Event.where("date_time > ?", Time.now.end_of_day)
  end
end
