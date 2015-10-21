class RegistrationsController < Devise::RegistrationsController

  def new
    super

    # Teams
    @teams = Team.all

    # Dorms
    @dorms = Team.all
  end

  private

  def sign_up_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :gender, :year, :tshirt, :avatar, :team, :residence)
  end

  def account_update_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end