class GroupController < ApplicationController
  def index
		@groups = User.get_group_admin(current_user.id)
		@user = current_user
	end

	def view_groups
		@groups = current_user.get_group_admin
		@user = current_user

		#render :layout => "group_layout"
	end

  	def view_group
  	end
end
