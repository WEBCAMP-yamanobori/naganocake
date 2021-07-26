class Admin::OrdersController < ApplicationController

  skip_before_action :authenticate_customer!, only: [:show, :update]
  before_action :if_not_admin

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
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end
  
  def order_params
    params.require(:order).permit(:status)
  end

end
