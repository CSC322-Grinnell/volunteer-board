class RemoveIdFromEventsSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :events_skills, :id, :integer
  end
end
