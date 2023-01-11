class Public::ProductsController < ApplicationController
  #商品の一覧画面
  def index
    @products = Product.all
  end
  
  # 商品の詳細画面
  def show
    @product = Product.find(params[:id])
  end
end
