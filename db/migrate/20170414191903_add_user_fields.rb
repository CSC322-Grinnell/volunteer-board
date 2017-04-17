class AddUserFields < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip_code, :string
    add_column :users, :phone_number, :string
    add_column :users, :private, :boolean
    rename_column :users, :firstname, :first_name
    rename_column :users, :lastname, :last_name
    
  end
end
