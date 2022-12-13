class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def unsubscribe

  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    redirect_to admin_customers_path
  end

  def reunion
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: false)
    redirect_to admin_customers_path
  end

  def update
  end

  def destroy
  end
end
