require 'rails_helper'

RSpec.describe SubscriptionController, type: :controller do


admin_role = Role.create! :role=> "SiteAdmin"

#Create a group to function as a Troop and set the admin to the created default admin
grouptest = Group.create! :name => "test group" #unless Group.find_by_name('test group')
grouptest.roles << admin_role unless grouptest.blank?

  describe "GET #generate_invoices" do
    it "returns http success" do
        get :generate_invoices, :group_id => 1
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #generate_invoices_pdf" do
    it "returns http success" do
        get :generate_invoices_pdf, :group_id => 1
      expect(response).to have_http_status(:success)
    end
  end

end
