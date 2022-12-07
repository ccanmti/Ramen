class Shop::CommentsController < ApplicationController

  def index
    @comments = current_shop.shop_comments
  end

  def destroy
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.destroy
    redirect_to shop_comments_path
  end
end
