class GroupController < ApplicationController
	before_filter :require_login

  def index
    #displays list of groups that user has access to.
		@groups = User.get_groups(current_user.id)
		@user = current_user
	end

	def view_groups
		@groups = current_user.get_groups unless current_user.nil?
		@user = current_user

		#render :layout => "group_layout"
	end

  	def view_group
    end

  def report
    #Generates report of troop member participation during runs for this calendar year.
    @group = Group.find(params[:id])

    #if the user cannot access this group, then we should throw an access denied error.
		raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
  end

  def report_pdf
    #Generates pdf version of report of troop member participation during runs for this calendar year.
    @group = Group.find(params[:id])

    #if the user cannot access this group, then we should throw an access denied error.
		raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
		render pdf: "troop_participation", :layout => "static_layout"
  end

end
