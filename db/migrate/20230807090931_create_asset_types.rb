class CreateAssetTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :asset_types do |t|
      t.string :product_catagory

      t.timestamps
    end
  end
end
