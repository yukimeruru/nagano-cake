class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  belongs_to :genre

  attachment :image

  def taxin_price
     price*1.1
  end

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true

end