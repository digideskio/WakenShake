class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    '/charges/registration_fee'
  end

  def new
    @teams = Team.all.order('name')
    @dorms = Dorm.all.order('name')

    super
  end

  def create
    @teams = Team.all.order('name')
    @dorms = Dorm.all.order('name')

    super

    # Queue up donation emails
    if resource.save
      logger.info "User - #{resource.email} has been created. Queueing up donation emails now..."
      params[:referral_emails_array].each_with_index do |referral, index|
        if referral.present?
          referral_object = Referral.create(name: params[:referral_names_array][index], email: referral)
          DonationMailer.request_a_donation(referral_object, resource).deliver_later
        end
      end
    end
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def sign_up_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :gender, :year, :tshirt, :avatar, :team, :residence, :dancing_for, :first_time, :team_id, :shift, :conditional_details, :food_allergies, :referral_array, :goal, :dorm_id, :contact_name, :contact_number, :disclaimer, :vegetarian, team_attributes: [:name])
  end

  def account_update_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :gender, :year, :tshirt, :avatar, :team, :residence, :dancing_for, :first_time, :team_id, :shift, :conditional_details, :food_allergies, :referral_array, :goal, :dorm_id, :vegetarian, team_attributes: [:name])
  end
end
