class LikesController < ApplicationController
  before_action :set_plan, only: [:create, :destroy]

  def create
    @like = current_user.likes.create(plan_id: params[:plan_id])
    @plans = Plan.all
  end

  def destroy
    like = current_user.likes.find_by(plan_id: params[:plan_id])
    like.destroy
    @plans = Plan.all
    respond_to do |format|
      format.js
    end

  end

  private

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

end
