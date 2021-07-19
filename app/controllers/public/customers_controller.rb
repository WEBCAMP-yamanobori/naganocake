class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    #@customer = Customer.find(params[:id])
  end

  def updated
  end

  def unsubscribe
  end

  def withdraw
  end

  private
    def customer_params
      params.repquire(:customer).permit(:lastname, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_delete)
    end
end
