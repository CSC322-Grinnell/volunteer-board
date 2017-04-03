class AddNumVolsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :num_vols, :string
  end
end
