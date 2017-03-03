class CreateAdmins < ActiveRecord::Migration[5.0]
  def migrate(direction)
    super
    # Create a default admin user
    AdminUser.create!(email: 'admin@example.com', password: 'volunteerboard',
      password_confirmation: 'volunteerboard') if direction == :up
  end
  
  def change
    create_table(:admins) do |t|
      # authenticate user in interface
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      # recover/reset a forgotten password
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      
      # date and time that admin was created
      t.datetime :admin_created_at
      
      # track admin
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.timestamps
    end
    
    # add to database
    add_index :admin_users, :email,               unique: true
    add_index :admin_users, reset_password_token, unique: true
  end
end
