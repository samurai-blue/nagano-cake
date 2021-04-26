class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :total_payment
      t.integer :production_status, default: 0, null: false

      t.timestamps
    end
  end
end
