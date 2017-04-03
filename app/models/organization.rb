class Organization < ApplicationRecord
   before_save { self.email = email.downcase }
   validates :name, presence: true, length: { maximum: 50 }
   validates :address, presence: true
   validates :city, presence: true
   validates :state, presence: true
   validates :zip, presence: true, length: { maximum: 5}
   validates :phone, presence: true
   validates :email, presence: true, uniqueness: { case_sensitive: false }
   validates :mission, presence: true
   validates :website, presence: true
   
end
