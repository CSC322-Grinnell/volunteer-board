class Event < ApplicationRecord
    validates :title,  presence: true, length: { maximum: 50 }
    belongs_to :user
    belongs_to :organization
end
