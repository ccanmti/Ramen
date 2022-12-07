class ShopComment < ApplicationRecord
  belongs_to :customer
  belongs_to :shop
  belongs_to :product
end
