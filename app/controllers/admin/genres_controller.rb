class Admin::GenresController < ApplicationController
  # 管理者側のジャンル一覧
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  # 管理者側のジャンルの編集
  def edit
    @genre = Genre.find(params[:id])
  end

  # 管理者側のジャンルの新規作成
  def create
    @genre = Genre.new(genre_params)
    @genre.save!
    redirect_to admin_genres_path
  end

  # 管理者側のジャンルの更新
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  # 管理者側のジャンルの
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  # ジャンルのストロングパラメータの設定
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
