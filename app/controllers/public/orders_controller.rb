class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
    @addresses = @customer.Address.all
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.save
    redirect_to orders_complete_customers_path

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
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
# ↓↓要変更↓↓
    @order.total_price = @order.shipping_cost
# ↑↑要変更↑↑
    if params[:order][:address_option] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name

    elsif params[:order][:address_option] == "1"

    else

    end
  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postcode, :address, :name, :shipping_cost, :total_price)
  end

end
