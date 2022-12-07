class Public::ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @genres = Genre.all
  end

  def show
    @shop = Shop.find(params[:id])
    @products = @shop.products
    @items = @shop.items
    @shop_comment = ShopComment.new
  end
end
