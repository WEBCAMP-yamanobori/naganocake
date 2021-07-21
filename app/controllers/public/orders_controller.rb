class Public::OrdersController < ApplicationController

  def new

    @customer = current_customer
    @order = Order.new
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

  end

  def index
  end

  def show
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to root_path
  end

  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postcode, :address, :name)
  end

end
