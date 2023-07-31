class RemoveRoleAndRoleIdFromStuffs < ActiveRecord::Migration[7.0]
  def change
    remove_column :stuffs, :role, :integer, null: false
    remove_column :stuffs, :role_id, :bigint
  end

end
