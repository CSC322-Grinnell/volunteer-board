class Organization < ApplicationRecord
  has_many :events
  
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true, length: { maximum: 60 }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true, length: { maximum: 10, minimum: 10 }
  validates :mission, length: { maximum: 250 }
  validates :website, format: { with: /https?:\/\/[\S]+/ }
  
  def address=(s)
    super s.titleize
  end
  
  def city=(s)
    super s.titleize
  end
  
  def state=(s)
    super s.titleize
  end
  
  
  
  def active_for_authentication? 
    super && approved? 
  end 
  
  def inactive_message 
    if !approved? 
      :not_approved 
    else 
      super # Use whatever other message 
    end
  end
  
  
  
end
