class Users::UsersController < ApplicationController
    
  def show
    @user = current_user
  end
    
  def edit
    @user = current_user
  end
    
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end
  
  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    @user = current_user
    @user.update(is_active: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :uid, :provider, :is_active)
  end
  
end