class TeamsController < ApplicationController
  
  def index
    if params[:search]
      @teams = Team.search(params[:search])
    else
      @teams = Team.all
    end
  end

  def create
  end

  def new
  end
end
