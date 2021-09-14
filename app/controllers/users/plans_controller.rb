class Users::PlansController < ApplicationController
    
  def index
    @plans = Plan.all
    @names = Plan.page(params[:page])
  end

  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    @plan.user_id = current_user.id
    if @plan.save
      redirect_to users_plans_path
    else
      render :new
    end
  end
  
  def show
    @plan = Plan.find(params[:id])
    @plans = Plan.all
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:plan][:id])
    @plan.update(plan_params)
    redirect_to users_plans_path
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to users_plans_path
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(:time, :schedule, :meal, :city_name, :lodgment_target_name)
  end
  
end