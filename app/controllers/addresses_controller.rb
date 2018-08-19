class AddressesController < ApplicationController

  def index
    @addresses = current_user.addresses.includes(:user)
  end

  def new
    @user = User.find(params[:user_id])
    @address = Address.new
  end

  def create
    @user = User.find(params[:user_id])
    @address = @user.addresses.new(address_params)
    if  @address.save
      redirect_to user_addresses_path(current_user)
    else
      @addresses = @user.addresses.includes(:user)
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:full_name, :postal_code, :prefecture, :city, :house_number, :tel).merge(user_id: current_user.id)
  end

end
