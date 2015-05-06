require 'rails_helper'

RSpec.describe RoutesController, type: :controller do

#describe "GET #view_routes" do
      #it "returns http success" do
        #get :view_routes
      #expect(response).to have_http_status(:success)
      #end
    # end
  
  #access as an unauthorized user
  
  describe "GET #view_routes" do
      it "returns http 302" do
          get :view_routes
          expect(response).to have_http_status(302)
      end
  end
  
  #route no longer exists for this!
  
  #describe "GET #view_route" do
  # it "returns http success" do
  #   get :view_route
  #   expect(response).to have_http_status(:success)
  # end
  #end

end
