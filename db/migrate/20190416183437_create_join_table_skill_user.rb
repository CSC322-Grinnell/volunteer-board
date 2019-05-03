class CreateJoinTableSkillUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :Skills, :Users, :id => false do |t|
       t.index [:skill_id, :user_id]
       t.index [:user_id, :skill_id]
    end
  end
end
