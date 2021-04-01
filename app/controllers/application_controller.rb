# frozen_string_literal: true

# Service to download ftp files from the server
class ApplicationController < ActionController::Base
  include SessionsHelper
  # def current_user
  #   current_user ||= User.find_by(id: session[:user_id])
  # end
end
