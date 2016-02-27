class AdminController < ApplicationController
  authorize_resource :class => false

  def index
    @dancers_count = Dancer.count
    @active_teams = Team.joins(:dancers).group("teams.id").count.count
    @amount_raised = Charge.where(is_donation: true).sum(:amount)
  end

  def mass_mailer
    @message = params[:message]
    @subject = params[:subject]
    if params[:type] == "Dancer"
      AdminMailer.mass_dancer(@message, @subject).deliver_now
    elsif params[:type] == "Donor"
      Referral.find_each do |donor|
        AdminMailer.mass_donor(donor, @message, @subject).deliver_later
      end
    end
    redirect_to admin_index_path
  end
end
