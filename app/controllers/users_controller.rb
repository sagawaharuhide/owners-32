class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def purchased
    @orders = current_user.orders.order(created_at: :desc)
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :image, :password)
  end

end
