class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    # @order_item = OrderItem.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    # @order_item = OrderItem.find(params[:id])
    @order.update(order_params)
    if @order.status == 1
      # @order.order_item.status = 1
      @order.order_items.update(status: 1)
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

  # def order_item_params
  #   params.require(:order_item).permit(:status)
  # end
end
