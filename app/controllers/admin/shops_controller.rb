class Admin::ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
  end

  def withdraw
    @customer = Shop.find(params[:id])
    @customer.update(is_deleted: true)
    redirect_to admin_shops_path
  end

  def reunion
    @customer = Shop.find(params[:id])
    @customer.update(is_deleted: false)
    redirect_to admin_shops_path
  end

  def update
  end
end
