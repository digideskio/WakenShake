class Newsletter < ApplicationMailer

  # weekly email newsletter for teams
  def weekly_mailer
    @top_dancers = Dancer.joins(:charges).group('dancers.id').order('sum(charges.amount) desc').limit(10)
    @top_teams = Team.order('amount_raised desc').limit(10)
    Team.joins(:dancers).each_with_index do |team, index|
      @dancers = team.dancers.pluck(:email)
      @team = team
      date_range = Date.today.beginning_of_week..Date.today.end_of_week
      @events = Event.where(date_time: date_range).all
      @ranking = index + 1
      mail(to: @dancers, subject: "Weekly Update - #{@team.name}")
    end
  end

  # test_emails
  def test_emails
    @top_dancers = Dancer.joins(:charges).group('dancers.id').order('sum(charges.amount) desc').limit(10)
    @top_teams = Team.order('amount_raised desc').limit(10)
    Team.joins(:dancers).limit(5).each_with_index do |team, index|
      @team = team
      date_range = Date.today.beginning_of_week..Date.today.end_of_week
      @events = Event.where(date_time: date_range).all
      @ranking = index + 1
      mail(to: "laddng12@wfu.edu", subject: "Weekly Update - #{@team.name}", template_name: "weekly_mailer")
    end
  end


end
