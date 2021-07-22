class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :payment_method, default: 0
      t.integer :total_price
      t.integer :shipping_cost
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
