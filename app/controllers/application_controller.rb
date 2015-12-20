class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  alias_method :current_user, :current_dancer

  require 'csv'

  @dancer_goal = 2000
  @team_goal = 10000
end
