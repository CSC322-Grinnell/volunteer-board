class AddPasswordDigestToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :password_digest, :string
  end
end
