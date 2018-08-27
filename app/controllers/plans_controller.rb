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
    # @course = @plans.course.where(price: minimum)
    # binding.pry
    respond_to do |f|
      f.json { render json: @plans.to_json( include: [:courses]) }
    end
  end

end
