class CartItem < ApplicationRecord
  belongs_to :member
  belongs_to :item

  def sum_of_price
    item.taxin_price * count
  end

end
