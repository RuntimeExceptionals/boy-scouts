class RoutesController < ApplicationController
  before_filter :require_login

  def view_routes
    #displays list of routes that signed in user has ability to see.
    @routes = Route.routes_for(current_user) || [] unless current_user.nil?
  end

  def view_routes_for_group
    #display list of routes that belong to a particular group.

    group_id = params[:id]
    @group = Group.find(group_id)
    @routes = @group.routes || []

    #If the user doesn't have access to view this information for the given group, then raise an access denied error.
    #Users access this group if it is included in user.get_groups
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group)
  end

  def view_route
    @route = Route.find(params[:id])

    #If the user doesn't have access to view this information for the given group, then raise an access denied error.
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless current_user.can_view_route(@route)
  end

  def get_run_info
    #this action is only used by javascript. If a valid run is currently happening, return it's progress, otherwise false.
    @route = Route.find(params[:route_id])
    if @route.runs_in_progress?
      render json: @route.runs_in_progress[0]
      return
    end

    render json: false
  end

end
