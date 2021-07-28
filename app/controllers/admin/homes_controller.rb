class Admin::HomesController < ApplicationController

  def top
    @orders = Order.page(params[:page]).per(10)
    # @order_items.quantity = @cart_items.quantity
  end
end
