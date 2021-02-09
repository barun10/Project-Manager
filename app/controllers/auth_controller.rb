class AuthController < ApplicationController
  def callback
    # current_user ||= User.find_by(id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    ms_account = @user.ms_accounts.where(username: auth.dig(:extra, :raw_info, :displayName)).first_or_initialize
    ms_account.update(
      # name: auth_hash.dig(:extra, :raw_info, :displayName),
      # image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to root_path, notice: "Successfully connected your account"
  end

  def auth
    request.env['omniauth.auth']
  end

end
