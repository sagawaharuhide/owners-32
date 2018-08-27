class OrdersController < ApplicationController
  before_action :set_course

  def new
    @plan = @course.plan
    @order = Order.new
    @addresses = current_user.addresses.new
  end

  def input
    @order = Order.new(order_params)
    binding.pry
    @addresses = current_user.addresses.new
    binding.pry
    @addresses = current_user.addresses.new(address_params)
    binding.pry
    # respond_to do |format|
    #   if @addresses.save
    #     format.html { redirect_to input_course_orders(@addresses)}
    #     format.json
    #   else
    #     format.html{ render :input }
    #   end
    # end
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

    def address_params
      params.permit(:full_name, :postal_code, :prefecture, :city, :house_number, :tel).merge(user_id: current_user.id)
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

end
