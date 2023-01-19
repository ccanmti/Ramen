class Shop::ShopsController < ApplicationController
  def show
    @shop = current_shop
    @businesshours = @shop.businesshours
    @shop_status = "Close"

    #月曜日のshopの営業状況判断
    if Date.today.wday == 1
      @businesshours.each do |businesshour|
        if businesshour.monday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

    #火曜日のshopの営業状況判断
    if Date.today.wday == 2
      @businesshours.each do |businesshour|
        if businesshour.tuesday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

    #水曜日のshopの営業状況判断
    if Date.today.wday == 3
      @businesshours.each do |businesshour|
        if businesshour.wednesday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

    #木曜日のshopの営業状況判断
    if Date.today.wday == 4
      @businesshours.each do |businesshour|
        if businesshour.thursday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

    #金曜日のshopの営業状況判断
    if Date.today.wday == 5
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

    #土曜日のshopの営業状況判断
    if Date.today.wday == 6
      @businesshours.each do |businesshour|
        if businesshour.sunday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

    #日曜日のshopの営業状況判断
    if Date.today.wday == 7
      @businesshours.each do |businesshour|
        if businesshour.friday == true
          if Time.current.strftime('%H%M').to_i.between?(businesshour.start_time.strftime('%H%M').to_i, businesshour.end_time.strftime('%H%M').to_i)
          @shop_status = "Open"
          end
        end
      end
    end

  end

  def edit
    @shop = current_shop
  end

  def update
    @shop = current_shop
    @shop.update(shop_params)
    redirect_to shop_shops_information_edit_path
  end

  def unsubscribe
    @shop = current_shop
  end

  def withdraw
    @shop = current_shop
    @shop.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def businesshour
    @shop = current_shop
    @businesshour = Businesshour.new
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :email, :postal_code, :address, :telephone_number, :image, :genre_id, :is_deleted)
  end
end
