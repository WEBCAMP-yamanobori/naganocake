class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :price
      t.integer :quantity
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
