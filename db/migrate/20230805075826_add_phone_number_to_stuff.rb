class AddPhoneNumberToStuff < ActiveRecord::Migration[7.0]
  def change
    add_column :stuffs, :phone_number, :string
  end
end
