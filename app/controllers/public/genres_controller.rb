class Public::GenresController < ApplicationController
  # ジャンル別店舗一覧
  def show
    @genre = Genre.find(params[:id])
    @shops = @genre.shops
  end
end
