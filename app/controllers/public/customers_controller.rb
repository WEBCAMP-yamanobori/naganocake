class Public::CustomersController < ApplicationController
  
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
    #@customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = current_customer
    @customer.update(is_delete: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  
  def customer_params
    params.require(:customer).permit(:lastname, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :is_delete)
  end
  
end
