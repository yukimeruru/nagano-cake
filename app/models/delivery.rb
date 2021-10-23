class Delivery < ApplicationRecord
  belongs_to :member

  def member_info
    "〒" + "" + post_code + "   " + address + "     " + name
  end
end
