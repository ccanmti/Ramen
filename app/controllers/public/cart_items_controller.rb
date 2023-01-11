class Public::CartItemsController < ApplicationController
  #カート内商品一覧
  def index
    @cart_items = current_customer.cart_items
    @total = 0                                 #@totalは合計金額でここで初期化を行っている
  end

  # カートに商品を登録する機能
  def create
    @cart_item = CartItem.new(cart_item_params)
    if CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)    #現在のcustomerのカート内に同一の商品が登録されているかを判断
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
      @cart_item.update(amount: params[:cart_item][:amount].to_i+@cart_item.amount)               #同一の商品があった場合数量のみを追加する
    else
    @cart_item.save!
    end
    redirect_to cart_items_path
  end

  #カート内の商品更新機能
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  # カート内の商品削除機能
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  # カート内商品の全削除機能
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  # ストロングパラメータの設定
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :shop_id)
  end
end
