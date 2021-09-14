class Admin::PlansController < ApplicationController
    
  def index
    @plans = Plan.all
    @names = Plan.page(params[:page])
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
    redirect_to admin_plans_path
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy(plan_params)
    redirect_to admin_plans_path
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(:time, :schedule, :meal, :city_name, :lodgment_target_name)
  end
  
end