class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  belongs_to :shop

  def subtotal
    price*amount
  end
end
