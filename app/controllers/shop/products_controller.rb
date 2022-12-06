class Shop::ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def index
    @products = current_shop.products
  end

  def show
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to edit_shop_product_path(@product)
  end

  def destroy
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    redirect_to shop_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :price, :image, :genre_id, :shop_id)
  end

end
