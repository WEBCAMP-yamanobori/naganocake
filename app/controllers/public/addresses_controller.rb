class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_back(fallback_location: root_path)
    else
      @customer =current_customer
      render :index
    end
  end


  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_back(fallback_location: root_path)
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to customers_addresses_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:customer_id, :name, :postcode, :address)
  end
end
