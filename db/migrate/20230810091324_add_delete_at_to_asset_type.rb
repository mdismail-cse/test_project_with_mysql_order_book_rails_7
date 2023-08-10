class AddDeleteAtToAssetType < ActiveRecord::Migration[7.0]
  def change
    add_column :asset_types, :delete_at, :datetime
  end
end
