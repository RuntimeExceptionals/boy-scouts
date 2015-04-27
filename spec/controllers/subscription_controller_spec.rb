require 'rails_helper'

RSpec.describe SubscriptionController, type: :controller do

  describe "GET #generate_invoices" do
    it "returns http success" do
      get :generate_invoices
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #generate_invoices_pdf" do
    it "returns http success" do
      get :generate_invoices_pdf
      expect(response).to have_http_status(:success)
    end
  end

end
