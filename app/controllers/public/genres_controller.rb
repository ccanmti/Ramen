class Public::GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @shops = @genre.shops
  end
end
