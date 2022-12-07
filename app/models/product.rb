class Product < ApplicationRecord
  has_one_attached :image
  belongs_to :shop
  belongs_to :genre
  has_many :shop_comments, dependent: :destroy
end
