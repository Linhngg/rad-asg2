class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]
  
  def login
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email],params[:login_password])
    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:success] = "Welcome, you logged in as #{authorized_user.username}"
      redirect_to(:controller => "news", :action => 'index')
    else
      flash[:warning] = "Log in failed"
      render "login"	
    end
  end
  
  def signup_and_login_attempt
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Sign up successfully"
      redirect_to(:controller => "news", :action => 'index')
    else
      flash[:warning] = "Sign up failed"
      render "login"
    end
  end

  def home
  end

  def profile
  end

  def setting
  end
  
  def logout
    session[:user_id] = nil
    flash[:success] = "Log out successfully. See you again"
    redirect_to :controller => "news", :action => 'index'
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
