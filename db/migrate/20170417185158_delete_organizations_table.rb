class DeleteOrganizationsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :organizations
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
