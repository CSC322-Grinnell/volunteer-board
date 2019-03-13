class Event < ApplicationRecord
    attr_accessor :start_date, :end_date, :start_hour, :start_minute, :start_ampm, :end_hour, :end_minute, :end_ampm

    has_and_belongs_to_many :users
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, presence: true
    validates :start_time, presence: true, date: { after_or_equal_to: Time.current }
    validates :end_time, presence: true, date: { after_or_equal_to:  :start_time}
    validates :num_vols, presence: true
    validates :location, presence: true
    validates :contact_phone, presence: true, length: { maximum: 10, minimum: 10 }
    validates :contact_email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

    def name=(s)
        super s.titleize
    end

    def description=(s)
        super s.capitalize
    end

    def location=(s)
        super s.titleize
    end
end
