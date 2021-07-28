class Admin::OrderItemsController < ApplicationController
  
  skip_before_action :authenticate_customer!
  before_action :if_not_admin
  
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    if @order_item.status == 2
      # @order.order_item.status = 1
      @order_item.order.update(status: 2)
    elsif @order_item.status == 3
      @order_item.order.update(status: 3)
    end
    redirect_back(fallback_location: root_path)
  end

  private
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end

  def order_item_params
    params.require(:order_item).permit(:status)
  end
  
end
