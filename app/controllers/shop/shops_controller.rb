class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
    @businesshours = @shop.businesshours
  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to shop_shops_information_edit_path
  end

  def unsubscribe
  end

  def withdraw
  end

  def businesshour
    @shop = current_shop
    @businesshour = Businesshour.new
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :postal_code, :address, :telephone_number, :image, :genre_id)
  end
end
