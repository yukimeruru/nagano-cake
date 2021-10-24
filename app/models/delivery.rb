class Delivery < ApplicationRecord
  belongs_to :member

  validates :name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true

  def member_info
    "〒" + "" + post_code + "   " + address + "     " + name
  end
end
