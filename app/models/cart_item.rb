class CartItem < ApplicationRecord
   belongs_to :customer
   belongs_to :item
   belongs_to :shop

   def subtotal
     item.price*amount
   end
end
