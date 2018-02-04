class Ability
  include CanCan::Ability

  def initialize(user)
    cannot :destroy, User, id: user.id

    if user.admin?
      can :manage, :all
    else
      can :manage, Post, user: user
      can :manage, User, id: user.id
    end

    unless user.present?
      cannot :manage, :all
    end
  end
end
