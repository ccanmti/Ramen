class Shop::ProductsController < ApplicationController
  # 商品の新規登録
  def new
    @product = Product.new
  end

  # 商品の一覧
  def index
    @products = current_shop.products
  end

  #商品の編集
  def edit
    @product = Product.find(params[:id])
  end

  #商品情報の更新
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to edit_shop_product_path(@product)
  end
  
  #商品情報の削除
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to shop_products_path
  end
  
  # 諸品情報の登録
  def create
    @product = Product.new(product_params)
    @product.save!
    tags = Vision.get_image_data(@product.image)    #画像認識によるタグ付け機能
    tags.each do |tag|
      @product.tags.create(name: tag)
    end
    redirect_to shop_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :price, :image, :genre_id, :shop_id)
  end

end
