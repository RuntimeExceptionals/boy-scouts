# spec/features/admin_dashboard_spec.rb
feature "Admin dashboard" do

  scenario "visitor is admin" do
    admin = User.create :email => 'a@b.com', :password => 'tests', :admin => true

    visit rails_admin_path(as: admin)
    expect(current_path).to eq(rails_admin_path)
  end
    
  scenario "visitor is not an admin user" do
    user = User.create :email => 'a@b.com', :password => 'tests'

    visit rails_admin_path(as: user)
    expect(current_path).to eq(root_path)
    end
end
