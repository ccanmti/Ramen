class Admin::CommentsController < ApplicationController
  # 管理者側のコメント一覧機能
  def index
    @comments = ShopComment.all
  end

# 管理者側のコメント削除機能
  def destroy
    @comment = ShopComment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path
  end

end
