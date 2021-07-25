class Admin::ItemsController < ApplicationController
  
  skip_before_action :authenticate_customer!, only: [:new, :create, :index, :show, :edit, :update]
  before_action :if_not_admin

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    @items = Item.all
    redirect_to admin_items_path
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_items_path(@item.id)
  end



  private
  
  def if_not_admin
    redirect_to root_path unless admin_signed_in?
  end
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :non_taxed_price, :is_active)
  end
  
end
