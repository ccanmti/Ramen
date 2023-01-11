class Public::OrdersController < ApplicationController
  # 注文情報を入力
  def new
    @order = Order.new(total_payment: params[:total_payment])
    @customer = current_customer
    @total = 0    #合計金額の初期化
  end
  
  # 注文情報を確定しカート内商品の情報を注文詳細に保存する。その後カート内商品の削除を行う
  def create
    @order = Order.new(order_params)
    @order.save!    #注文情報を確定
    @cart_items = current_customer.cart_items     #@cart_itemsに現在のユーザーのカート内商品を格納
    @cart_items.each do |cart_item|             #これより下記のコードは@cart_itemのデータを@order_detailに格納している
      @order_detail = OrderDetail.new
      @order_detail.price = cart_item.item.price
      @order_detail.amount = cart_item.amount
      @order_detail.item_id = cart_item.item_id
      @order_detail.shop_id = cart_item.shop_id
      @order_detail.order_id = @order.id
      @order_detail.save
    end
    @cart_items.destroy_all         #@order_detailにデータを格納した後はカート内商品のデータは不要のため削除
    redirect_to orders_complete_path
  end
  
  # 注文履歴一覧
  def index
    @orders = current_customer.orders
  end
  
  # 注文履歴詳細
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0      #合計金額の初期化
  end

  # 注文確認画面
  def confirm
    @order = Order.new(order_params)
    @shipping_cost = 800                     #配送手数料
    @cart_items = current_customer.cart_items
    @total = 0                               #合計金額の初期化
    @order.payment_method
    if params[:order][:select_delivery] == "0"      #select_deliveryは注文情報入力画面で選択肢があり、配送先を登録済みの住所や新規作成の選択肢によって下記の処理が変わる
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
     render 'confirm'
    elsif params[:order][:select_delivery] == "1"
      @order1 = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @order1.postal_code
      @order.address = @order1.address
      @order.name = @order1.name
    else params[:order][:select_delivery] == "2"
    end
  end
  
  #注文確定の画面表示
  def complete
  end
  
  #注文のストロングパラメータの
  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end
end
