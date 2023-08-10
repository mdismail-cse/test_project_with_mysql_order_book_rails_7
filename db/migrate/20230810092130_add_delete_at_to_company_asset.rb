class AddDeleteAtToCompanyAsset < ActiveRecord::Migration[7.0]
  def change
    add_column :company_assets, :delete_at, :datetime
  end
end
