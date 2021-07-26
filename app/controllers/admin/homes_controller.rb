class Admin::HomesController < ApplicationController

  def top
    # @orders = Order.all
    @orders = Order.page(params[:page]).per(10)
    @cart_items = CartItem.all
    # @order_items.quantity = @cart_items.quantity
  end
end
