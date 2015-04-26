RailsAdmin.config do |config|
  
  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
  
  # Configure the new user model to support Clearance config.
  config.model "User" do
    edit do
      field :admin
      field :email
      field :password
    end
  end

  # Only allow access to the admin panel if the current user
  # is an admin, otherwise redirect to root.
  config.authorize_with :cancan
  config.current_user_method(&:current_user)

end
