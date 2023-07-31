class RemoveRoleFromSuff < ActiveRecord::Migration[7.0]
  def change
    remove_column :stuffs, :role, :integer
  end
end
