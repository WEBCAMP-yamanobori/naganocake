class Public::ItemsController < ApplicationController
  
  def index
    # @items = Item.all
    # @items = Item.page(params[:page]).reverse_order
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :non_taxed_price, :is_active)
  end
end
