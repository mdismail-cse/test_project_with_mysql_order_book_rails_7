class AddDeleteAtToPosition < ActiveRecord::Migration[7.0]
  def change
    add_column :positions, :delete_at, :datetime
  end
end
