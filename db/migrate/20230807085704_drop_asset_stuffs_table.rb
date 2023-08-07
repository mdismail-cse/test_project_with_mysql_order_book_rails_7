class DropAssetStuffsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :asset_stuffs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
