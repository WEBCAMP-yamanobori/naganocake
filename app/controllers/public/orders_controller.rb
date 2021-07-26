class Public::OrdersController < ApplicationController

  def new
    @customer = current_customer
    @order = Order.new
  end

  def create
    @customer = current_customer
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
     @cart_items.each do |cart_item|
        @order_items = @order.order_items.new
        @order_items.item_id = cart_item.item.id
        @order_items.price = cart_item.item.non_taxed_price
        @order_items.quantity = cart_item.quantity
        @order_items.save
     end
    redirect_to orders_complete_customers_path

  end

  def index
    @customer = current_customer
    @orders = @customer.orders.page(params[:page]).per(10)
    # @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def show
    @order = Order.find(params[:id])
    # @order_item = `order.order_items
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
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.sum_of_price }
# ↓↓要変更↓↓
    @order.total_price = @total_price + @order.shipping_cost
# ↑↑要変更↑↑
    if params[:order][:address_option] == "0"
      @order.postcode = @customer.postcode
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name

    else

    end


  end

  def complete
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postcode, :address, :name, :shipping_cost, :total_price, :status)
  end

end
