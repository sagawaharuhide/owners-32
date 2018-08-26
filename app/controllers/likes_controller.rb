class LikesController < ApplicationController
  before_action :set_pran, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(plan_id: params[:plan_id])
    @plans = Plan.all
  end

  def destroy
    like = current_user.Likes.find_by(plan_id: params[:plan_id])
    like.destroy
    @plans = Plan.all
  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

end
