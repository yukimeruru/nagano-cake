class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|

      t.integer :member_id, null: false
      t.string :name, null: false
      t.string :post_code, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
