class Public::ItemsController < ApplicationController
  
  skip_before_action :authenticate_customer!, only: [:index, :show]
  # skip_before_action :authenticate_admin!, only: [:index, :show]
  
  def index
    @items = Item.all
    @genres = Genre.all
  end
  
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    # if customer_signed_in?
    @cart_item = CartItem.new
    # else
    #   render :show
    # end
  end
  
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :non_taxed_price, :is_active)
  end
end
