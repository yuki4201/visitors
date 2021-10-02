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
      redirect_to plans_path
    else
      render :new
    end
  end
  
  def show
    @plan = Plan.find(params[:id])
  end

  def edit
    @plan = Plan.find(params[:id])
    unless @plan.user_id == current_user.id #URL入力による投稿編集画面への遷移を防止
      redirect_to  plans_path
    end
  end

  def update
    @plan = Plan.find(params[:plan][:id])
    @plan.update(plan_params)
    redirect_to plans_path
  end
  
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_path
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(:time, :schedule, :meal, :city_name, :lodgment_target_name)
  end
  
end