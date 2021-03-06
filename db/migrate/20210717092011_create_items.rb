class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.integer :non_taxed_price
      t.text :introduction
      t.string :image_id
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
