class Public::FavoritesController < ApplicationController
  def index
    @shops = current_customer.favorites
  end

  def create
    shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.new(shop_id: shop.id)
    favorite.save
    redirect_to shops_path
  end

  def destroy
    shop = Shop.find(params[:shop_id])
    favorite = current_customer.favorites.find_by(shop_id: shop.id)
    favorite.destroy
    redirect_to shops_path
  end
end
