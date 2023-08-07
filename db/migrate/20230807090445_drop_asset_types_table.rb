class DropAssetTypesTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :asset_types
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
