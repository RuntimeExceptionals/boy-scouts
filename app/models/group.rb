class Group < ActiveRecord::Base
  acts_as_tree order: "name"

  has_and_belongs_to_many :users

  has_many :routes
  has_many :subscriptions


end
