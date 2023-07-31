class AgainAddRoleToStuff < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :role, :integer , deafult: 3
  end
end
