class AddApprovedToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :approved, :boolean, default: false, null: false
  end
end
