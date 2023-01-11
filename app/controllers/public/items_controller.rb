class Public::ItemsController < ApplicationController
  # 通販商品の詳細
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
