class Shop::ItemsController < ApplicationController
  # 店舗側の通販商品一覧
  def index
    @item = Item.new
    @items = current_shop.items
  end

  # 通販商品の作成
  def create
    @item = Item.new(item_params)
    if @item.introduction.blank?
      @item.introduction = ""
    end
    @item.save!
    redirect_to
  end

  # 通販商品の情報の編集
  def edit
    @item = Item.find(params[:id])
  end

  # 通販商品の情報の更新
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to shop_items_path
  end

  # 通販商品のストロングパラメータの設定
  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image, :genre_id, :shop_id)
  end
end
