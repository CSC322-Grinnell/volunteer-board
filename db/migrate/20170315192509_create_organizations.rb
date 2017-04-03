class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :phone
      t.string :email
      t.string :mission
      t.string :website

      t.timestamps
    end
  end
end
