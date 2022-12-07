class Genre < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :shops, dependent: :destroy
end
