class User < ActiveRecord::Base
  
  include Clearance::User

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :routes
  has_and_belongs_to_many :runs

  Roles = [ :admin , :leader, :member, :subscriber ]

  def admin?
    self.groups.each do |g|
      g.roles.each do |r|
        if r.role == "SiteAdmin"
          return true
        end
      end
    end
  false
  end

  def troop_leader?
    self.groups.each do |g|
      g.roles.each do |r|
        if r.role == "TroopLeader"
          return true
        end
      end
    end
    false
  end

  def troop_member?
    self.groups.each do |g|
      g.roles.each do |r|
        if r.role == "TroopMember"
          return true
        end
      end
    end
    false
  end

  def role
    if admin?
      :admin
    elsif troop_leader?
      :leader
    elsif troop_member?
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

  def get_groups
    if self.is? :admin
      groups_admin_for = []
      Group.all().each do |grp|
          if grp.has_role? "TroopMember"
              groups_admin_for.append grp 
          end
      end
      groups_admin_for
    elsif self.is? :leader
      groups_admin_for = []
      self.groups.each do |grp|
        if grp.has_role? "TroopLeader"
          groups_admin_for += grp.children if grp
        end
      end
      groups_admin_for
    elsif self.is? :member
      self.groups.to_a
    end
  end

  def can_view_route(route)
    if self.get_groups.blank?
      return false
    end

    self.get_groups.each do |g|
      if g.routes.where(:id => route.id)
        return true
      end
    end
    return false
  end

end
