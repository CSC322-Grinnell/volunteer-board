class AddOrganizationFields < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :name, :string
    add_column :organizations, :address, :string
    add_column :organizations, :city, :string
    add_column :organizations, :state, :string
    add_column :organizations, :zip, :string
    add_column :organizations, :phone, :integer
    add_column :organizations, :mission, :string
    add_column :organizations, :website, :string
  end
end
