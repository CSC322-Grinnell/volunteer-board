class UserOrgMerge < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mission, :string
    add_column :users, :website, :string
    drop_table :organizations
  end
end
