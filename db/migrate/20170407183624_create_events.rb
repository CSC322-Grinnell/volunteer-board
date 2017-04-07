class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :num_vols
      t.string :location
      t.string :contact_phone
      t.string :contact_email

      t.timestamps
    end
  end
end
