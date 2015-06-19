class DancersController < ApplicationController
  before_action :set_dancer, only: [:show, :edit, :update, :destroy]

  # GET /dancers
  # GET /dancers.json
  def index
    if params[:search]
      @articles = Dancer.search(params[:search])
    else
      @dancers = Dancer.all
    end
  end

  # GET /dancers/1
  # GET /dancers/1.json
  def show
  end

  # GET /dancers/new
  def new
    @dancer = Dancer.new
  end

  # GET /dancers/1/edit
  def edit
  end

  # POST /dancers
  # POST /dancers.json
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

  # PATCH/PUT /dancers/1
  # PATCH/PUT /dancers/1.json
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

  # DELETE /dancers/1
  # DELETE /dancers/1.json
  def destroy
    @dancer.destroy
    respond_to do |format|
      format.html { redirect_to dancers_url, notice: 'Dancer was removed.' }
      format.json { head :no_content }
    end
  end

  # Function to donate money to dancer
  def donate
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_dancer
      @dancer = Dancer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dancer_params
      params.require(:dancer).permit(:first_name, :last_name)
    end
end
