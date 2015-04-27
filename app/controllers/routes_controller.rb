class RoutesController < ApplicationController

  def view_routes
    @routes = Route.routes_for(current_user)
  end

end
