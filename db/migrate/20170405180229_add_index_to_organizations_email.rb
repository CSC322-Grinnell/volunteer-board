class AddIndexToOrganizationsEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :organizations, :email, unique: true
  end
end
