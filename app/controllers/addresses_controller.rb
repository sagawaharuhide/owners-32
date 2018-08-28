class AddressesController < ApplicationController
  before_action :set_user

  def index
    @addresses = current_user.addresses.includes(:user)
  end

  def new
    @address = Address.new
  end

  def create
    @address = @user.addresses.new(address_params)
    if  @address.save
      respond_to do |format|
        format.html {redirect_to user_addresses_path(current_user)}
        format.json
    else
      @addresses = @user.addresses.includes(:user)
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_addresses_path(current_user)
    else
      @addresses = @user.addresses.includes(:user)
      render :edit
    end
  end


  private

  def address_params
    params.require(:address).permit(:full_name, :postal_code, :prefecture, :city, :house_number, :tel).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

end
