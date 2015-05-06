require 'rails_helper'

RSpec.describe GroupController, type: :controller do

#describe "GET #view_groups" do
      #it "returns http success" do
        #get :view_groups
        #expect(response).to have_http_status(:success)
      #end
    #end

#describe "GET #view_group" do
      #it "returns http success" do
        #get :view_group
      #expect(response).to have_http_status(:success)
      #end
    # end
    
    #unauthorized user attempts to access the page

describe "GET #view_groups" do
    it "returns http 302" do
        get :view_groups
        expect(response).to have_http_status(302)
    end
end

describe "GET #view_group" do
    it "returns http 302" do
        get :view_group
        expect(response).to have_http_status(302)
    end
end

end
