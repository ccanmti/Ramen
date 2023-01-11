class Public::CommentsController < ApplicationController
  # コメントの新規作成
  def create
    shop = Shop.find(params[:shop_id])
    comment = current_customer.shop_comments.new(shop_comment_params)
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop)
  end

  # 顧客側のコメント一覧
  def index
    @shop_comments = current_customer.shop_comments
  end

  # 顧客側のコメント編集
  def edit
    @shop_comment = ShopComment.find(params[:id])
  end

  # 顧客側のコメント編集
  def update
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.update(shop_comment_params)
    redirect_to edit_comment_path
  end

  # 顧客側のコメント削除
  def destroy
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.destroy
    redirect_to comments_path
  end

  # コメントのストロングパラメータ設定
  private
  def shop_comment_params
    params.require(:shop_comment).permit(:comment, :product_id, :customer_id, :shop_id)
  end
end
