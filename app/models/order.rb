class Order < ApplicationRecord
  belongs_to :member

  validates :member_id, presence: true
  validates :shipping, presence: true
  validates :final_price, presence: true
  validates :payment_method, presence: true
  validates :name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :order_status, presence: true
  
  has_many :order_items, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { not_pay: 0, check_pay: 1, make: 2, ready: 3, shipped: 4 }
end
