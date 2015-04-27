Clearance.configure do |config|
    
  # Specify some defaults for the user authentication.
  config.user_model = User
  config.cookie_domain = '.boyscoutsflagroutes.com'
  config.cookie_name = 'authentication_token'

  # Disable signups, as they will be done through the admin panel.
  config.allow_sign_up = false
end