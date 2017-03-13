json.extract! organization, :id, :name, :address, :state, :city, :zip-code, :phone-number, :email, :mission, :website, :password, :confirm-password, :created_at, :updated_at
json.url organization_url(organization, format: :json)
