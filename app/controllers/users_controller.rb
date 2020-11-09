class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You have successfully signed up"
      redirect_to root_path
    else 
      render 'new'
    end
  end

  def login
  end

  def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are logged in"
      redirect_to root_path
    else
      flash[:notice] = "Invalid username/password combination."
      render('login')
    end  
  end

  private

    def user_params
      params.require(:user).permit(:name,:email,:password)
    end
end
