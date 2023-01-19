class Public::HomesController < ApplicationController
  # トップページ
  def top
    @shops = Shop.all.page(params[:page]).per(4).order('created_at DESC')   #店舗の表示数を３店舗のみとしている
  end

end
