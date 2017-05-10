class AddVolunteerCountToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :volunteer_count, :integer
  end
end
