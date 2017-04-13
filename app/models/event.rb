class Event < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :num_vols, presence: true
    validates :location, presence: true
    validates :contact_phone, presence: true, length: { maximum: 10, minimum: 10 }
    validates :contact_email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
