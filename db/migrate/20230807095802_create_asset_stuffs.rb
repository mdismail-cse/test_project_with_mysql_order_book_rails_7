class CreateAssetStuffs < ActiveRecord::Migration[7.0]
  def change
    create_table :asset_stuffs do |t|
      t.integer :status
      t.datetime :assign_at
      t.datetime :return_at
      t.references :company_asset, null: false, foreign_key: true
      t.references :stuff, null: false, foreign_key: true

      t.timestamps
    end
  end
end
