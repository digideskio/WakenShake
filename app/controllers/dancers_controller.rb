class DancersController < ApplicationController
  before_action :set_dancer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    if params[:search]
      @dancers = Dancer.search(params[:search])
    else
      @top_6_dancers = Dancer.joins(:charges).where('charges.is_donation=true').select('dancers.id, avatar_file_name, stafftitle, first_name, last_name, sum(charges.amount) as total_raised').group('dancers.id').order('total_raised desc').limit(6)

      @dancers = Dancer.all.order(last_name: :asc)
      respond_to do |format|
        format.html
        format.csv do
          headers['Content-Disposition'] = "attachment; filename=\"dancer-list.csv\""
          headers['Content-Type'] ||= 'text/csv'
        end
      end
    end
  end

  def show
    @dancer = Dancer.find(params[:id])
    @amount_raised_goal = (@dancer.charges.where(is_donation: true).sum(:amount)/@dancer.goal)*100
    @donations = @dancer.charges.where(is_donation: true)
    @charge = Charge.new
    @charge_record = Charge.new
    @referral = Referral.new
    @registration_fee = @dancer.charges.where(is_registration_fee: true).empty?
  end

  def new
    @dancer = Dancer.new
  end

  def edit
    @teams = Team.all
    @dorms = Dorm.all 
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
    @teams = Team.all
    @dorms = Dorm.all
    respond_to do |format|
      if @dancer.update(dancer_params)
        sign_in(current_dancer, :bypass => true)
        format.html { redirect_to @dancer, notice: 'Dancer was updated.' }
        format.json { render :edit, status: :ok, location: @dancer }
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

  def set_staff
    @dancer = Dancer.find(params[:id])
    @dancer.update_attribute(:staff_member, params[:value])
    @dancer.save
    redirect_to @dancer
  end

  def set_admin
    @dancer = Dancer.find(params[:id])
    @dancer.update_attribute(:admin, params[:value])
    @dancer.save
    redirect_to @dancer
  end

  def set_committee
    @dancer = Dancer.find(params[:id])
    @dancer.update_attribute(:stafftitle, params[:stafftitle])
    @dancer.save
    redirect_to @dancer
  end

  def send_donation_email
    dancer = Dancer.find(params[:dancer_id])
    referral_object = Referral.create(email: params[:referral_email], name: params[:referral_name])
    DonationMailer.request_a_donation(referral_object, dancer).deliver_later
    redirect_to :back, notice: "Your donation request email has been sent."
  end

  private

    def set_dancer
      @dancer = Dancer.find(params[:id])
    end

    def dancer_params
      params.require(:dancer).permit(:first_name, :last_name, :password, :email, :avatar, :year, :gender, :tshirt, :residence, :shift, :first_time, :hear_about, :food_allergies, :vegetarian, :contact_name, :contact_number, :conditional_details, :dancing_for, :stafftitle, :bio, :goal, :team_id, :dorm_id)
    end
end
