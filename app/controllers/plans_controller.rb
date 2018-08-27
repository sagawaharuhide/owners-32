class PlansController < ApplicationController

  def index
    @plans = Plan.all
    @categories = Category.all
  end

  def show
    @plan = Plan.find(params[:id])
    @courses = Course.where(plan_id: params[:id])
  end

  def sort_by_category
    @plans = Plan.where(category_id: params[:id])
    respond_to do |f|
      f.json { render json: @plans.to_json( include: [:courses]) }
    end
  end

  def sort_by_price
    @plans = Plan.includes(:courses).order('courses.price ASC')
    respond_to do |f|
      f.json { render json: @plans.to_json( include: [:courses]) }
    end
  end

end
