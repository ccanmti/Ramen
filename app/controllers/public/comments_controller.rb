class Public::CommentsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    comment = current_customer.shop_comments.new(shop_comment_params)
    comment.shop_id = shop.id
    comment.save
    redirect_to shop_path(shop)
  end

  def index
    @shop_comments = current_customer.shop_comments
  end

  def edit
    @shop_comment = ShopComment.find(params[:id])

  end

  def update
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.update(shop_comment_params)
    redirect_to edit_comment_path
  end

  def destroy
    @shop_comment = ShopComment.find(params[:id])
    @shop_comment.destroy
    redirect_to comments_path
  end

  private

  def shop_comment_params
    params.permit(:comment, :product_id)
  end
end
