class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  
  
  private
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :non_taxed_price, :is_active)
  end
end
