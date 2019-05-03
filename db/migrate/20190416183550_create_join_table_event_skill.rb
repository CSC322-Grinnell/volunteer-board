class CreateJoinTableEventSkill < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Events, :Skills, :id => false do |t|
       t.index [:event_id, :skill_id]
       t.index [:skill_id, :event_id]
    end
  end
end
