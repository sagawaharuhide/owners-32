class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.last_name = params[:last_name]
    user.first_name = params[:first_name]
    user.email = params[:email]
    user.save
    redirect_to user_path(current_user)
  end

end
