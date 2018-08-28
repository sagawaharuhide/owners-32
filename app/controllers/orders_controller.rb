class OrdersController < ApplicationController
  before_action :set_course

  def new
    @plan = @course.plan
    @order = Order.new
  end

  def input
    @order = Order.new(order_params)
  end

  def confirm
    @plan = @course.plan
    @order = Order.new(order_params)
    @address = @order.address

    render :new if params[:back]
  end

  def create
    @plan = @course.plan
    @order = Order.new(order_params)
    @address = @order.address

    if params[:back]
      render :input
    elsif @order.save
    else
      render :new
    end
  end

  private
    def order_params
      params.require(:order).permit(:quantity, :address_id).merge(course_id: params[:course_id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

end
