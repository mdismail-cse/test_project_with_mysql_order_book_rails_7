class AddDeleteAtToSupplier < ActiveRecord::Migration[7.0]
  def change
    add_column :suppliers, :delete_at, :datetime
  end
end
