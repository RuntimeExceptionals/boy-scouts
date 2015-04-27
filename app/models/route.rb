class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_and_belongs_to_many :users

  def self.routes_for(user)
    case user.role
      when :admin
        Route.all
      when :leader
      when :member
        user.routes
      else
    end
  end

end
