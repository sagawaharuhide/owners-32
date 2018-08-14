class PlansController < ApplicationController

  def index
    @plans = Plan.all
  end

  def show
    @plan = Plan.find(params[:id])
    @courses = Course.where(plan_id: params[:id])
  end

end
