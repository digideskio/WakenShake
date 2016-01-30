class ChargesController < ApplicationController

  # GET /charges
  # GET /charges.json
  def index
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

  # GET /charges/registration_fee
  def registration_fee
    @charge = Charge.new
  end

  # POST /charges
  # POST /charges.json
  def create

    # determine if the charge is a donation or registration fee
    @description = ""
    if params[:is_donation].present?
      @description = "Wake \'N Shake Donation"
    elsif params[:is_registration_fee].present?
      @description = "Wake \'N Shake Registration Fee"
    end

    # registration fee amount - $20
    @amount = 20

    # if not registration fee, set donation amount
    if params[:donation_amount].present?
      @amount = params[:donation_amount].to_i
    end

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount*100,
      description: @description,
      currency: 'usd'
    )

    # associate the charge to a team or dancer
    if params[:charge_type] == "Dancer"
      @dancer = Dancer.find(params[:dancer_id])
      charge_record = @dancer.charges.new(amount: @amount, email: params[:stripeEmail])
      if params[:is_donation].present?
        charge_record.is_donation = true
        charge_record.save
      elsif params[:is_registration_fee].present?
        charge_record.is_registration_fee = true
        charge_record.save
      end
    elsif params[:charge_type] == "Team"
      @team = Team.find(params[:team_id])
      charge_record = @team.charges.new(amount: @amount, email: params[:stripeEmail], is_donation: true)
    elsif params[:charge_type] == "All"
      charge_record = Charge.new(amount: @amount, email: params[:stripeEmail], is_donation: true)
    end

    if charge_record.save
      if charge_record.is_registration_fee.present?
        redirect_to dancer_path(@dancer)
      elsif charge_record.is_donation.present?
        redirect_to charge_record
      end
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:amount, :charged_id, :charged_type, :is_registration_fee, :is_donation, :stripeEmail, :stripeToken)
    end
end
