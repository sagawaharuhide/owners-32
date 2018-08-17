class OrdersController < ApplicationController

  def new
    @course = Course.find(params[:course_id])
    @plan = @course.plan
    @order = Order.new
  end

  def input
    @course = Course.find(params[:course_id])
    @order = Order.new(order_params)
  end

  def confirm
    @course = Course.find(params[:course_id])
    @plan = @course.plan
    @order = Order.new(order_params)

    render :new if params[:back]
  end

  def create
    @course = Course.find(params[:course_id])
    @order = Order.new(order_params)

    if params[:back]
      render :input
    elsif @order.save
    else
      render :new
    end
  end

  private
    def order_params
      params.require(:order).permit(:quantity)
    end

end
