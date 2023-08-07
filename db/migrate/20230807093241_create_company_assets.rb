class CreateCompanyAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :company_assets do |t|
      t.string :name
      t.string :product_address
      t.string :details
      t.references :asset_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
