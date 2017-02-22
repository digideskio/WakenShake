class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource :except => [:index, :show]

  # GET /teams
  # GET /teams.json
  def index
    if params[:search]
      @sorority = Team.where(category: "Sorority").joins(:dancers).distinct.search(params[:search]).order('amount_raised desc')
      @fraternity = Team.where(category: "Fraternity").joins(:dancers).distinct.search(params[:search]).order('amount_raised desc')
      @open = Team.where(category: "Open").joins(:dancers).distinct.search(params[:search]).order('amount_raised desc')
    else
      @fraternity = Team.where(category: "Fraternity").joins(:dancers).distinct.order('amount_raised desc')
      @sorority = Team.where(category: "Sorority").joins(:dancers).distinct.order('amount_raised desc')
      @open = Team.where(category: "Open").joins(:dancers).distinct.order('amount_raised desc')
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:id])
    @donations = @team.charges.where(is_donation: true)
    @charge = Charge.new
    @dancers = @team.dancers.order('last_name asc')
    @charge_record = Charge.new
    @amount_raised_goal = (@team.amount_raised/10000)*100
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.amount_raised = 0.00 if @team.amount_raised.nil?
    @team.category = "Open" if @team.category.nil?

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name)
    end
end
