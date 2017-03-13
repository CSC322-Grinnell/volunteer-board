class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :phone_number
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.boolean :private

      t.timestamps
    end
  end
end
