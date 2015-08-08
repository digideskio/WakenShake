class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= Dancer.new # guest user (not logged in)
      if user.admin?
        can :manage, :all
      elsif user.is_accountant?
        can :manage, @donations
      else
        can :read, :all
      end
  end
end
