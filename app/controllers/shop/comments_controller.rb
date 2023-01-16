class Shop::CommentsController < ApplicationController
  # 店舗側のコメント一覧
  def index
    @comments = current_shop.shop_comments
  end

  # 店舗側のコメント削除
  def destroy
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.destroy
    redirect_to shop_comments_index_path
  end
end
