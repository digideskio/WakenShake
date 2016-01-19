class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  # GET /charges
  # GET /charges.json
  def index
    @charges = Charge.all
  end

  # GET /charges/1
  # GET /charges/1.json
  def show
  end

  # GET /charges/new
  def new
    @charge = Charge.new
  end

  # GET /charges/1/edit
  def edit
  end

  def registration
    @charge = Charge.new
  end

  # POST /charges
  # POST /charges.json
  def create
    @charge = Charge.new(charge_params)

    @amount = 2000

    # charge amount
    @charge.amount = @amount

    @description = ""

    # determine if the charge is a donation or registration fee
    if params[:is_donation].present?
      @charge.is_donation = true
      @description = "Wake \'N Shake Donation"
    elsif params[:is_registration_fee].present?
      @charge.is_registration_fee = true
      @description = "Wake \'N Shake Registration Fee"
    end

    # associate the charge to a team or dancer
    if params[:charge_type] == "Dancer"
      @charge.dancer = Dancer.find(params[:charge_id])
    elsif params[:charge_type] == "Team"
      @charge.team = Team.find(params[:charge_id])
    end

    # provide the email address for the charge
    @charge.email = params[:stripeEmail]

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Wake \'N Shake Registration Fee',
      currency: 'usd'
    )

    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'Charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @charge, notice: 'Charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge }
      else
        format.html { render :edit }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charges/1
  # DELETE /charges/1.json
  def destroy
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to charges_url, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge
      @charge = Charge.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:amount, :charged_id, :charged_type, :is_registration_fee, :is_donation, :stripeEmail, :stripeToken)
    end
end
