class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  alias_method :current_user, :current_dancer

  def after_sign_in_path_for(resource)
    resource
  end

  require 'csv'
  require 'openssl'

  @dancer_goal = 2000
  @team_goal = 10000
end
