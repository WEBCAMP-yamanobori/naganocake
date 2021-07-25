class Admin::OrderItemsController < ApplicationController
  
  skip_before_action :authenticate_customer!
  before_action :if_not_admin
  
  private
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end
  
end
