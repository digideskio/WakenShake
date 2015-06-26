class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :gender, :year, :tshirt, :avatar)
  end

  def account_update_params
    params.require(:dancer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end
end