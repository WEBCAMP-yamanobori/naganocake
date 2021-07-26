class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    # @order_items.quantity = @cart_items.quantity
  end
end
