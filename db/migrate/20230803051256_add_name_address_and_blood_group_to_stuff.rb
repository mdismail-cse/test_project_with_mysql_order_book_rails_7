class AddNameAddressAndBloodGroupToStuff < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :name, :string, null: true
    add_column :stuffs, :address, :string, null: true
    add_column :stuffs, :blood_group, :string, null: true
  end
end

