class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, [Ticket,User]
    elsif user.has_role? :user
      can :read, Ticket
    end
  end
end
