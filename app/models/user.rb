class User < ActiveRecord::Base
  
  include Clearance::User

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :routes

  Roles = [ :admin , :leader, :member, :subscriber ]

  def admin?
    self.groups.each do |g|
      if g.admin?
        return true
      end
    end
  false
  end

  def role
    if admin?
      :admin
    else
      # TODO: other roles
      :member
    end
  end

  def is?(role_type)
    return role == role_type
  end

  def display_name
    self.last_name.to_s + ", " + self.first_name.to_s
  end

  def full_name
    self.first_name.to_s + self.last_name.to_s
  end

  def get_group_admin
    group = self.groups
  end

end
