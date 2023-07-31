class AddRoleToStuff < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :role, :integer , deafult: 0
  end
end
