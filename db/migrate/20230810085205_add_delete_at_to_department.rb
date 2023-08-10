class AddDeleteAtToDepartment < ActiveRecord::Migration[7.0]
  def change
    add_column :departments, :delete_at, :datetime
  end
end
