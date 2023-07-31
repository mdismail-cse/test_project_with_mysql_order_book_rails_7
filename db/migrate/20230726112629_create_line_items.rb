class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.integer :uint_price
      t.integer :quantity
      t.integer :total_price
      t.references :product, null: false, foreign_key: true
      t.references :purchase_order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
