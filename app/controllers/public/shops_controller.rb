class Public::ShopsController < ApplicationController
  def index
    @shops = Shop.all
    @genres = Genre.all
    @q = Shop.ransack(params[:q])
    @shops = @q.result(distinct: true)

    @shop_status = "Close"    #営業状況を初期化

  end

  def show
    @shop = Shop.find(params[:id])
    @products = @shop.products
    @items = @shop.items
    @shop_comment = ShopComment.new
    @businesshours = @shop.businesshours

    @shop_status = "Close"    #営業状況を初期化
    #月曜日のshopの営業状況判断
    if Date.today.wday == 1
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end

    #火曜日のshopの営業状況判断
    if Date.today.wday == 2
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end

    #水曜日のshopの営業状況判断
    if Date.today.wday == 3
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end

    #木曜日のshopの営業状況判断
    if Date.today.wday == 4
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end
    #金曜日のshopの営業状況判断
    if Date.today.wday == 5
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end

    #土曜日のshopの営業状況判断
    if Date.today.wday == 6
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end

    #日曜日のshopの営業状況判断
    if Date.today.wday == 7
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          else
          end
        else
        end
      end
    end

  end
end
