class Order < ApplicationRecord
  belongs_to :member

  enum payment_method: {credit_card: 0, transfer: 1 }

  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  validates :member_id, presence: true
  validates :shipping, presence: true
  validates :final_price, presence: true
  validates :payment_method, presence: true
  validates :name, presence: true
  validates :post_code, presence: true
  validates :address, presence: true
  validates :order_status, presence: true
end
