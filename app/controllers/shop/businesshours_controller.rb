class Shop::BusinesshoursController < ApplicationController
  def create
    @businesshour = Businesshour.new(businesshour_params)
    if @businesshour.save!
      redirect_to shop_shops_my_shop_path, notice: "営業時間を追加しました"
    else
      @shop = current_shop.id
      render template: "shop/shops/businesshour"
    end
  end

  def edit
    @businesshours = current_shop.businesshours
    @businesshour = Businesshour.find(params[:id])
  end

  def update
    @businesshour = Businesshour.find(params[:id])
    if @businesshour.update!(businesshour_params)
      redirect_to shop_shops_my_shop_path, notice: "営業時間を更新しました"
    else
      @businesshour.start_time = "00:00" if @businesshour.start_time.nil?
      @businesshour.end_time = "00:00" if @businesshour.end_time.nil?
      render "edit"
    end
  end

  def update_all
    @businesshours = current_shop.businesshours
    @businesshours.update_all(businesshour_params)
    redirect_to request.referer
  end

  def destroy
    @businesshour = Businesshour.find(params[:id])
    @businesshour.destroy
    redirect_to request.referer, notice: "営業時間を削除しました"
  end

  private

  def businesshour_params
    params.require(:businesshour).permit(:start_time, :end_time, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :holiday, :detail, :shop_id)
  end
end
