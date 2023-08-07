class DropAssetsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :assets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
