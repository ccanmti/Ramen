class Admin::CustomersController < ApplicationController
  # 管理者側の顧客一覧
  def index
    @customers = Customer.all
  end

  # 管理者側の顧客詳細
  def show
    @customer = Customer.find(params[:id])
  end

  # 管理者側の顧客退会・復会機能
  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)         #is_deletedをtrueにすることで退会になる
    redirect_to admin_customers_path
  end

  def reunion
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: false)        #is_deletedをfalseにすることで復会になる
    redirect_to admin_customers_path
  end

end
