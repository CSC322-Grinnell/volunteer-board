class RemoveIdFromSkillsUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills_users, :id, :integer
  end
end
