class UserOrgMergePart2 < ActiveRecord::Migration[5.0]
  def change
    # This is stupid. This should all be one operation, but apparently I have
    # to get it right the first time.
    add_column :users, :organization, :boolean
  end
end
