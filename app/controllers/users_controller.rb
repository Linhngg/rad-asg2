class UsersController < ApplicationController
  before_filter :save_login_state, :only => [:new, :create]
  
  def new
    @user = User.new 
  end
  
  def create
    # @user = User.new(params[:user])
    # @user = User.new(user_params)
    # if @user.save
    #   flash[:notice] = "You signed up successfully"
    #   flash[:color]= "valid"
    # else
    #   flash[:notice] = "Form is invalid"
    #   flash[:color]= "invalid"
    # end
    # render "new"
    @user = User.new(user_params)
    if @user.save
      return true
    else
      return false
    end
  end
  
  def user_params
    params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
  end
end
