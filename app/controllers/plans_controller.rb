class PlansController < ApplicationController

  def index
    @plans = Plan.all
    @categories = Category.all
  end

  def show
    @plan = Plan.find(params[:id])
    @courses = Course.where(plan_id: params[:id])
  end

  def search
    @plans = Plan.where(category_id: params[:id])
    render json: @plans
  end

end
