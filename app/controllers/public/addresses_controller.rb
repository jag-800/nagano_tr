class Public::AddressesController < ApplicationController

  def index
    @addresses = Adress.all
    @address = Address.new
  end

  def create
    address = Address.new(address_params)
    address.save
    redirect_to addresses_path
  end
  
  def edit
    @address = address.find(params[:id])
  end
  
  def update
    address = Address.new(address_params)
    if address.update
      redirect_to addresses_path
    else
      @address = address.find(params[:id])
      render :edit
    end
  end
  
  def destroy
    address = address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end
  
  private

  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
  
end
