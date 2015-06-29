class DancersController < ApplicationController
  before_action :set_dancer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    if params[:search]
      @dancers = Dancer.search(params[:search])
    else
      @dancers = Dancer.all
    end
  end

  def show
  end

  def new
    @dancer = Dancer.new
  end

  def edit
  end

  def create
    @dancer = Dancer.new(dancer_params)

    respond_to do |format|
      if @dancer.save
        format.html { redirect_to @dancer, notice: 'Dancer was created.' }
        format.json { render :show, status: :created, location: @dancer }
      else
        format.html { render :new }
        format.json { render json: @dancer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @dancer.update(dancer_params)
        format.html { redirect_to @dancer, notice: 'Dancer was updated.' }
        format.json { render :show, status: :ok, location: @dancer }
      else
        format.html { render :edit }
        format.json { render json: @dancer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dancer.destroy
    respond_to do |format|
      format.html { redirect_to dancers_url, notice: 'Dancer was removed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_dancer
      @dancer = Dancer.find(params[:id])
    end

    def dancer_params
      params.require(:dancer).permit(:first_name, :last_name, :password, :email, :avatar, :year, :gender, :tshirt, :residence, :shift, :first_time, :hear_about, :food_allergies, :vegetarian, :contact_name, :contact_number, :conditional_details, :dancing_for)
    end
end
