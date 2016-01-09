class RegistrationsController < Devise::RegistrationsController

  def new
    @teams = Team.all
    @dorms = Dorm.all

    super
  end

  def create
    super

    logger.info "User - #{params[:email]} has been created. Queueing up 
    donation emails now..."

    # Queue up donation emails
    params[:referral_array].each do |referral|
      DonationMailer.request_a_donation(referral).deliver_later
    end
  end

  private

  def sign_up_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :gender, :year, :tshirt, :avatar, :team, :residence, :dancing_for, :first_time, :team_id, :shift, :conditional_details, :food_allergies, :referral_array, :goal, :dorm_id)
  end

  def account_update_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :goal, :dorm_id)
  end
end
