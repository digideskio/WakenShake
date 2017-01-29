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

    # associate the charge to a team or dancer
    if params[:charge_type] == "Dancer"
      @dancer = Dancer.find(params[:dancer_id])
      charge_record = @dancer.charges.new(amount: @amount, email: params[:email])
      if params[:is_donation].present?
        charge_record.is_donation = true
        charge_record.save
        if @dancer.team_id != nil
          @team = Team.find(@dancer.team_id)
          @team.amount_raised += @amount
          @team.save
        end
      elsif params[:is_registration_fee].present?
        charge_record.is_registration_fee = true
        charge_record.save
      end
    elsif params[:charge_type] == "Team"
      @team = Team.find(params[:team_id])
      charge_record = @team.charges.new(amount: @amount, email: params[:email], is_donation: true)
      charge_record.save
      @team.amount_raised += @amount
      @team.save
    elsif params[:charge_type] == "All"
      charge_record = Charge.new(amount: @amount, email: params[:email], is_donation: true)
      charge_record.save
    end

    if charge_record.save
      if charge_record.is_registration_fee.present?
        redirect_to dancer_path(@dancer)
      elsif charge_record.is_donation.present?
        #DonationMailer.donation_notification(charge_record).deliver_later
        if params[:charge_type] == "Dancer"
          redirect_to dancer_path(@dancer), notice: "Your donation was processed successfully!"
        elsif params[:charge_type] == "Team"
          redirect_to team_path(@team), notice: "Your donation was processed successfully!"
        else
          render :action => "show"
        end
      end
    end
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
      params.require(:charge).permit(:amount, :charged_id, :charged_type, :is_registration_fee, :is_donation, :email)
    end
end
