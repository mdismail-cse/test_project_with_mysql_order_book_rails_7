class AddStuffIdToPurchaseOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_orders, :stuff_id, :integer, null: true
  end
end
