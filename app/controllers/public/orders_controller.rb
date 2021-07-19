class Public::OrdersController < ApplicationController
  
  def new
    @customer = Customer.find(params[:current_user_id])
    @order = Order.new
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  def confirm
  end
  
  def complete
  end
  
  private
  
end
