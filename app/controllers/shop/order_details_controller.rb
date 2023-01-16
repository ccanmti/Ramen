class Shop::OrderDetailsController < ApplicationController
  # 店舗ごとの通販商品の注文履歴一覧
  def index
      @order_details = current_shop.order_details
  end

end
