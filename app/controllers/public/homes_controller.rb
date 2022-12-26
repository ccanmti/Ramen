class Public::HomesController < ApplicationController
  def top
    @shops = Shop.all.page(params[:page]).per(3).order('created_at DESC')
  end

  def about
  end
end
