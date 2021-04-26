# frozen_string_literal: true

require 'securerandom'

# Service to download ftp files from the server
class SessionsController < ApplicationController
  def new; end

  def create
    if auth
      user_name = auth.dig(:extra, :raw_info, :displayName)
      user_email = auth.dig(:extra, :raw_info, :mail) || auth.dig(:extra, :raw_info, :userPrincipalName)
      if !User.exists?(email: user_email)
        user = User.new
        user.name = user_name
        user.email = user_email
        user.password = SecureRandom.hex(6)
        user.save
      else
        user = User.find_by(email: user_email)
      end
      log_in user
      redirect_to root_path, notice: 'Successfully connected your account via ms'
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user&.authenticate(params[:session][:password])
        log_in user
        redirect_to root_path, flash: { success: 'You have successfully logged in' }
      else
        flash[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end
end
