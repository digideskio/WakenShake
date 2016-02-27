class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= Dancer.new # guest user (not logged in)
      can :manage, Dancer, id: user.id
      if user.admin?
        can :manage, :all
      elsif user.staff_member?
        can :manage, Charge
        cannot :read, :admin
      else
        can :read, :all
        cannot :read, :admin
      end
  end
end
