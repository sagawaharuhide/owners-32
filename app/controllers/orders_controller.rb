class OrdersController < ApplicationController

  def index
    @course = Course.find(params[:course_id])
    @plan = @course.plan
  end

end
