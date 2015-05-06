require 'rails_helper'


RSpec.describe RunSheetsController, type: :controller do

  describe "GET #generate_runsheets_pdf" do
    it "returns http success" do
        get :generate_runsheets_pdf, :id => 1
      expect(response).to have_http_status(:success)
    end
  end

end
