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
    redirect_to my_page_path
  end
  
  def unsubscribe
    @user = current_user
  end
  
  def withdraw
    @user = current_user
    @user.update!(is_valid: false)
    reset_session
    redirect_to root_path
  rescue => e
    logger.error(e)
    logger.error(e.backtrace.join("\n"))
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :encrypted_password, :uid, :provider, :is_valid)
  end
  
end