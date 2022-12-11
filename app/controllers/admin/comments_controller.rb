class Admin::CommentsController < ApplicationController
  def index
    @comments = ShopComment.all
  end

  def destroy
    @comment = ShopComment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end

end
