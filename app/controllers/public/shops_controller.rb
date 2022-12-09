class Public::ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @genres = Genre.all
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)
  end

  def show
    @shop = Shop.find(params[:id])
    @products = @shop.products
    @items = @shop.items
    @shop_comment = ShopComment.new
    @businesshours = @shop.businesshours
  end
end
