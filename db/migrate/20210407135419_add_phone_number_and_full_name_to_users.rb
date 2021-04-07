class AddPhoneNumberAndFullNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :phone_number, :string
    add_index :users, :phone_number, unique: true
  end
end