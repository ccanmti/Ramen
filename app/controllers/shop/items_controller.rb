class Shop::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = current_shop.items
  end

  def create
    @item = Item.new(item_params)
    if @item.introduction.blank?
      @item.introduction = ""
    end
    @item.save!
    redirect_to
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to shop_items_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id, :shop_id)
  end
end
