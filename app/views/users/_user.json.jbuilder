json.extract! user, :id, :first_name, :last_name, :address, :city, :state, :zip_code, :phone_number, :email, :password, :password_confirmation, :private, :created_at, :updated_at
json.url user_url(user, format: :json)
