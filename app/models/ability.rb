class Ability
  include CanCan::Ability

  def initialize(user)
    if user.role == "adm"
      can :create, :all
      can :update, :all
      can :delete, :all

    end
  end
end
