class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :shop_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :businesshours, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_one_attached :image

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
