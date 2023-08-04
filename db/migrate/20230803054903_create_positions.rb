class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :post_name
      t.string :description
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
