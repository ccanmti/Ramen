class Admin::ShopsController < ApplicationController
  # 管理者側の店舗一覧
  def index
    @shops = Shop.all
  end

  # 管理者側の店舗の詳細
  def show
    @shop = Shop.find(params[:id])
  end

  # 管理者側の店舗の退会・復会機能
  def withdraw
    @customer = Shop.find(params[:id])
    @customer.update(is_deleted: true)      #is_deletedをtrueにすることで退会になる
    redirect_to admin_shops_path
  end

  def reunion
    @customer = Shop.find(params[:id])
    @customer.update(is_deleted: false)     #is_deletedをfalseにすることで復会になる
    redirect_to admin_shops_path
  end

end
