class AuthController < ApplicationController
  skip_before_action :set_user
  def callback
    # Access the authentication hash for omniauth
    data = request.env['omniauth.auth']
  
    # Save the data in the session
    save_in_session data
    flash[:notice] = "You are logged in via microsoft"
    # redirect_to login_path
    redirect_to users_dashboard_path
  end
end
