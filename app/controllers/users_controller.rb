class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  
  # Unused but can be used for sign up new user
  def new
    @user = User.new 
  end
  
  # Unused
  def create
    @user = User.new(user_params)
    if @user.save
      return true
    else
      return false
    end
  end
  
  # Unused
  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
