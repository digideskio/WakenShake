class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # for CanCan to see current dancer
  alias_method :current_user, :current_dancer

  require 'csv'
end
