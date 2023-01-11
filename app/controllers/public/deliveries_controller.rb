class Public::DeliveriesController < ApplicationController
  # 顧客側の配送先一覧
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  # 顧客側の配送先編集
  def edit
    @delivery = Delivery.find(params[:id])
  end

  # 顧客側の配送先登録
  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.save!
    redirect_to deliveries_path
  end

  # 顧客側の配送先削除
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  # 顧客側の配送先更新
  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to edit_delivery_path(@delivery.id)
  end

  # 配送先ストロングパラメータ設定
  private
  def delivery_params
    params.require(:delivery).permit(:customer_id, :name, :postal_code, :address,)
  end
end
