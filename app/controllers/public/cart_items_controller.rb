class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items.all
    # @total = @items.inject(0) { |sum, item| sum + item.sum_of_price }
  end

  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    @cart_items = current_user.cart_items.all
    @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_quantity = cart_item.quantity + @cart_item.quantity
      cart_item.update_attribute(:quantity, new_quantity)
      @cart_item.delete
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:customer_id, :item_id, :quantity)
  end

end
