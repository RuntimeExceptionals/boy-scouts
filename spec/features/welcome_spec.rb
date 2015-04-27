# spec/features/welcome_spec.rb
feature "Welcome screen" do
  before { visit root_path }

  scenario "visitor cannot access routes" do
    expect(page).not_to have_selector(:link_or_button, "Routes")
  end

  scenario "users can access routes" do
    user = User.create :email => 'a@b.com', :password => 'tests', :can_view_routes => true
    visit root_path(as: user)
    expect(page).to have_link("Routes")
  end
end