class AddRoleToStuffs < ActiveRecord::Migration[7.0]
  def change
    add_reference :stuffs, :role, null: true, foreign_key: true, deafult: 3
  end
end
