class Organization < ApplicationRecord
   validates :name, presence: true
   validates :address, presence: true
   validates :city, presence: true
   validates :state, presence: true
   validates :zip, presence: true
   validates :phone, presence: true
   validates :email, presence: true
   validates :mission, presence: true
   validates :website, presence: true
   validates :password, presence: true
   validates :confirm, presence: true
   
end
