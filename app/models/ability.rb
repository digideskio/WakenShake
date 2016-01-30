class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= Dancer.new # guest user (not logged in)
      can :manage, Dancer, id: user.id
      if user.admin?
        can :manage, :all
      else
        can :read, :all
      end
  end
end
