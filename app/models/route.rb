class Route < ActiveRecord::Base
  belongs_to :group
  has_many :subscriptions
  has_many :runs
  has_and_belongs_to_many :users

  def self.routes_for(user)
    if !user
      return []
    end

    case user.role 
      when :admin
        Route.all
      when :leader
        leader_routes = []
        user.get_groups.each do |grp|
          leader_routes += grp.routes
        end
        leader_routes
      when :member
        user.routes
    end
  end

  def runs_in_progress
    in_progress = []
    self.runs.each do |run|
      if run.in_progress? and run.datetime_started.in_time_zone("Central Time (US & Canada)").to_date() == Date.today()
        in_progress.append(run)
      end
    end
    in_progress_details = []
    in_progress.each do |run|
      in_progress_details.append(run.progress)
    end
    in_progress_details
  end

  def runs_in_progress?
    return !self.runs_in_progress.blank?
  end

end
