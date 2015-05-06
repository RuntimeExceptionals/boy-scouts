class Run < ActiveRecord::Base
  belongs_to :route
  has_many :tasks
  has_and_belongs_to_many :users

  def in_progress?
    if !self.datetime_started.blank? && self.datetime_ended.blank?
      return true
    end
    false
  end

  def finished?
    return !self.datetime_started.blank? && !self.datetime_ended.blank?
  end

  def progress
    #Returns hash with keys done and todo detailing run progression
    subs = self.route.subscriptions.order(:print_sequence)
    completed_tasks = self.tasks

    run_progress = Hash([])
    run_progress["id"] = self.id
    run_progress["ampm"] = self.am_pm
    run_progress["todo"] = []
    run_progress["done"] = []

    subs.each do |sub|
      if tasks.where(:run_id => self.id, :subscription_id => sub.id).blank?
          run_progress["todo"].append(sub)
      else
        run_progress["done"].append(sub)
      end
    end

    run_progress
  end

end
