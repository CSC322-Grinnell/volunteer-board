class Event < ApplicationRecord
<<<<<<< HEAD
    has_and_belongs_to_many :users
=======
    belongs_to :organization
>>>>>>> 7cdb0e0278ccdd7a411f1a91d995191b4aeb66a4
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, presence: true
    validates :start_time, presence: true, date: { after_or_equal_to: Time.current }
    validates :end_time, presence: true, date: { after_or_equal_to:  :start_time}
    validates :num_vols, presence: true
    validates :location, presence: true
    validates :contact_phone, presence: true, length: { maximum: 10, minimum: 10 }
    validates :contact_email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
