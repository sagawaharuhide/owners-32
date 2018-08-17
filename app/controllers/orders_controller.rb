class OrdersController < ApplicationController

  def new
    @plan = Plan.find(params[:plan_id])
    @order = Order.new
  end

  def input
    @plan = Plan.find(params[:plan_id])
    @order = Order.new(order_params)
  end

  def confirm
    @plan = Plan.find(params[:plan_id])
    @order = Order.new(order_params)

    render :new if params[:back]
  end

  def create
    @plan = Plan.find(params[:plan_id])
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
