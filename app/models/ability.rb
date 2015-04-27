class Ability

  include CanCan::Ability

  def initialize(user)
    # Handle guest users.
    if (!user)
      return
    end

    if user.is? :admin
      # TODO
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
    elsif user.is? :leader
      # TODO
      can :access, :routes
      can :access, :troops
    elsif user.is? :member
      # TODO
      can :access, :routes
    else
      # TODO
    end
  end
  
end
