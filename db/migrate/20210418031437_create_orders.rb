class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.text :send_to_address
      t.string :name
      t.integer :shipping_cost, default: 800
      t.integer :total_payment
      t.integer :payment_method
      t.integer :order_status

      t.timestamps
    end
  end
end
