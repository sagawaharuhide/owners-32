class OrdersController < ApplicationController

  def new
    @course = Course.find(params[:course_id])
    @plan = @course.plan
    @order = Order.new
  end

  def input
    @course = Course.find(params[:course_id])
    @addresses = current_user.addresses
    @order = Order.new(order_params)
  end

  def confirm
    @course = Course.find(params[:course_id])
    @plan = @course.plan
    @order = Order.new(order_params)
    @address = @order.address


    render :new if params[:back]
  end

  def create
    @course = Course.find(params[:course_id])
    @addresses = current_user.addresses
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

end
