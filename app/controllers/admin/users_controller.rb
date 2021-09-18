class Admin::UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @plans = @user.plans
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_users_path
  end
  
  def unsubscribe
    @user = User.find(params[:id])
  end
  
  def withdraw
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to admin_users_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :uid, :provider, :is_active)
  end
  
end