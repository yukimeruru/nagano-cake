class OrderItem < ApplicationRecord
  belongs_to :item

  belongs_to :order

  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :price, presence: true
  validates :count, presence: true
  validates :make_status, presence: true

  enum make_status: {not_make: 0, wait_make: 1, make: 2, done_make: 3 }

end
