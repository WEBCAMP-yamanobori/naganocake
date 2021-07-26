class Admin::CustomersController < ApplicationController
  
  skip_before_action :authenticate_customer!, only: [:index, :show, :edit, :update]
  before_action :if_not_admin

  def index
    # @customers = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      @customers = Customer.all
      redirect_to admin_customers_path
    else
      render :edit
    end
  end


  private
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :address, :phone_number, :is_delete)
  end

end
