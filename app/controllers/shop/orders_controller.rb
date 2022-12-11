class Shop::OrdersController < ApplicationController
  def index
    @orders = order_details.orders
  end
end
