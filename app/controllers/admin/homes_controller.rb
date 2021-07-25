class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @cart_items = CartItem.all
    # @order_items.quantity = @cart_items.quantity
  end
end
