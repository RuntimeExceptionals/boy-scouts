class AdminAbility
  include CanCan::Ability
  def initialize(user)
    can :access, :rails_admin
    can :manage, :all
  end

end