class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { not_pay: 0, check_pay: 1, make: 2, ready: 3, shipped: 4 }
end
