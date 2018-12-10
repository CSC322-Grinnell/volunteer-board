class User < ApplicationRecord
    has_and_belongs_to_many :events
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    #validates :address, presence: true
    #validates :city, presence: true
    #validates :state, presence: true
    #validates :zip_code, presence: true
    before_validation :strip_phone_number
    #validates :phone_number, allow_blank: true, length: {minimum: 10, maximum: 10}
    validates :phone_number, length: {minimum: 10, maximum: 10}
    validates :email, presence: true
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
    
    def first_name=(s)
        super s.titleize
    end

    def strip_phone_number
     phone_number.gsub!(/[^0-9]/, '')
    end
    
    def last_name=(s)
        super s.titleize
    end
    
    def address=(s)
        super s.to_s.titleize
    end
    
    def city=(s)
        super s.titleize
    end
    
    def state=(s)
        super s.titleize
    end
    
    def after_confirmation
        welcome_email
    end
    
    def welcome_email
        UserMailer.welcome_email(self).deliver_now
    end
    
end
