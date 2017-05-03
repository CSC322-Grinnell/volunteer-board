class ChangeVolunteerCount < ActiveRecord::Migration[5.0]
  def change
    change_column_default :events, :volunteer_count, to: 0
  end
end
