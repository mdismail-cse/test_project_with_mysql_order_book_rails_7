class AddDeleteAtToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :delete_at, :datetime
  end
end
