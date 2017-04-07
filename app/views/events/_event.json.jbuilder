json.extract! event, :id, :name, :description, :start_time, :end_time, :num_vols, :location, :contact_phone, :contact_email, :created_at, :updated_at
json.url event_url(event, format: :json)
