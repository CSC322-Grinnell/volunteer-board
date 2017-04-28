class AddOrganizationIdToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :organization_id, :integer
  end
end
