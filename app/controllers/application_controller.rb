class ApplicationController < ActionController::Base
  def save_in_session(auth_hash)
    # Save the token info
    session[:graph_token_hash] = auth_hash.dig(:credentials)
    # Save the user's display name
    session[:user_name] = auth_hash.dig(:extra, :raw_info, :displayName)
    # Save the user's email address
    # Use the mail field first. If that's empty, fall back on
    # userPrincipalName
    session[:user_email] = auth_hash.dig(:extra, :raw_info, :mail) ||
                           auth_hash.dig(:extra, :raw_info, :userPrincipalName)
  end

  def user_name
    session[:user_name]
  end
  
  def user_email
    session[:user_email]
  end
  
  def access_token
    session[:graph_token_hash][:token]
  end

  before_action :set_user

  def set_user
    @user_name = user_name
    @user_email = user_email
  end
end
