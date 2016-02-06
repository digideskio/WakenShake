class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    '/charges/registration_fee'
  end

  def new
    @teams = Team.all
    @dorms = Dorm.all

    super
  end

  def create
    @teams = Team.all
    @dorms = Dorm.all

    super

    logger.info "User - #{resource.email} has been created. Queueing up 
    donation emails now..."

    # Queue up donation emails
    params[:referral_emails_array].each do |referral|
      DonationMailer.request_a_donation(referral).deliver_later
    end
  end

  private

  def sign_up_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :gender, :year, :tshirt, :avatar, :team, :residence, :dancing_for, :first_time, :team_id, :shift, :conditional_details, :food_allergies, :referral_array, :goal, :dorm_id, :vegetarian, team_attributes: [:name])
  end

  def account_update_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :gender, :year, :tshirt, :avatar, :team, :residence, :dancing_for, :first_time, :team_id, :shift, :conditional_details, :food_allergies, :referral_array, :goal, :dorm_id, :vegetarian, team_attributes: [:name])
  end
end
