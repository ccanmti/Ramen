class Public::FavoritesController < ApplicationController
  # いいねをしたショップ一覧
  def index
    @shops = current_customer.favorites
  end

  # 店舗にいいねの登録
  def create
    shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.new(shop_id: shop.id)     #いいねがすでにされている場合はいいねができない
    favorite.save
    redirect_to shops_path
  end
  
  # 店舗にいいねの削除
  def destroy
    shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.find_by(shop_id: shop.id)
    favorite.destroy
    redirect_to shops_path
  end
end
