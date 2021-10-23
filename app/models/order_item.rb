class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order, dependent: :destroy

  enum make_status: {not_make: 0, wait_make: 1, make: 2, done_make: 3 }

end
