class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    item = Item.new(item_params)
    # item.admin_id = admin.id
    if item.save
      redirect_to admin_items_path
    else
      @items = Item.all
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    # item.admin_id = admin.id
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :genre_id, :is_active)
  end

end
