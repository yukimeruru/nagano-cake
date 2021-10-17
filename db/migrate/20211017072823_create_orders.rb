class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :member_id, null: false
      t.integer :shipping, null: false
      t.integer :final_price, null: false
      t.integer :payment_method, null: false, default: 0
      t.string :name, null: false
      t.string :post_code, null: false
      t.string :address, null: false
      t.integer :order_status, null: false, default: 0

      t.timestamps
    end
  end
end
