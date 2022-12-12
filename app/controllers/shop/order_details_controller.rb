class Shop::OrderDetailsController < ApplicationController
  def index
      @order_details = current_shop.order_details
  end

  def show

  end
end
