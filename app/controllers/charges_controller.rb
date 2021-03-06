class ChargesController < ApplicationController

  # GET /charges
  # GET /charges.json
  def index
    @charge = Charge.new
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
    @charge = Charge.find(params[:id])
  end

  # GET /charges/registration_fee
  def registration_fee
    @charge = Charge.new
  end

  # POST /charges
  # POST /charges.json
  def create
    if not params[:stripeToken].present?
      charge_record = Charge.create!(charge_params)
      DonationMailer.donation_notification(charge_record).deliver_later
      redirect_to(:back)
    elsif params[:stripeToken].present?
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
          DonationMailer.donation_notification(charge_record).deliver_later
          redirect_to charge_record
        end
      end
    else
      redirect_to root_path
    end
  rescue Stripe::CardError => e
    logger.debug e.message
    redirect_to :back, flash: { error:"#{e.message} Please try again or try another card." }
  end

  # PATCH/PUT /charges/1
  # PATCH/PUT /charges/1.json
  def update
    @charge = Charge.find(params[:id])
    if @charge.charged_type == "Dancer"
      @redirect = Dancer.find(@charge.charged_id)
    elsif @charge.charged_type = "Team"
      @redirect = Team.find(@charge.charged_id)
    end
    respond_to do |format|
      if @charge.update(charge_params)
        format.html { redirect_to @redirect, notice: 'Charge was successfully updated.' }
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
    @charge = Charge.find(params[:id])
    if @charge.charged_type == "Dancer"
      @redirect = Dancer.find(@charge.charged_id)
    elsif @charge.charged_type = "Team"
      @redirect = Team.find(@charge.charged_id)
    end
    @charge.destroy
    respond_to do |format|
      format.html { redirect_to @redirect, notice: 'Charge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_params
      params.require(:charge).permit(:amount, :charged_id, :charged_type, :is_registration_fee, :is_donation, :stripeEmail, :stripeToken, :email)
    end
end
