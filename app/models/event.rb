class Event < ApplicationRecord
    #before_validation :format_time
    
    belongs_to :organization
    has_and_belongs_to_many :users
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, presence: true
    validates :start_time, presence: true, date: { after_or_equal_to: Time.current }
    validates :end_time, presence: true, date: { after_or_equal_to:  :start_time}
    validates :num_vols, presence: true
    validates :location, presence: true
    validates :contact_phone, presence: true, length: { maximum: 10, minimum: 10 }
    validates :contact_email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
    #def location=(s)
    #    super s.titleize
    #end
    
    #def format_time
    #    h = hour + (12 * self.ampm)
    #    time = h.to_s + minute + ampm
    #    DateTime.strptime(time, '%Y-%m-%dT%H:%M:%S%z')
    #end

end
