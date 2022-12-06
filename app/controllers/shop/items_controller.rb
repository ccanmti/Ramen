class Shop::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = current_shop.items
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to shop_items_path
  end

  def edit

  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id, :shop_id)
  end
end
