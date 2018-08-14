class OrdersController < ApplicationController

  def index
    @plan = Plan.find(params[:plan_id])
  end

end
