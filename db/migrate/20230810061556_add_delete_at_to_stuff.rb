class AddDeleteAtToStuff < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :delete_at, :datetime
  end
end
