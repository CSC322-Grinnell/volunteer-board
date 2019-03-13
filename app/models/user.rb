class User < ApplicationRecord
    #set up to reject weak passwords
    devise :zxcvbnable
    has_and_belongs_to_many :events
    validates :first_name, presence: true, length: { maximum: 50 }, if: :not_organization?
    validates :last_name, presence: true, length: { maximum: 50 }, if: :not_organization?
    validates :name, presence: true, length: { maximum: 50 }, if: :organization?
    before_validation :strip_phone_number
    #validates :phone_number, allow_blank: true, length: {minimum: 10, maximum: 10}
    validates :phone_number, length: {minimum: 10, maximum: 10}
    validates :email, presence: true

    validates :address, presence: true, if: :organization?
    validates :city, presence: true, if: :organization?
    validates :state, presence: true, if: :organization?
    validates :zip_code, presence: true, if: :organization?
    validates :mission, length: { maximum: 250 }, if: :organization?

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

    def organization?
        return organization
    end

    def not_organization?
        return (not organization)
    end

  def active_for_authentication?
    super && (!organization || approved)
  end

  def inactive_message
    if !approved
      :not_approved
    else
      super # Use whatever other message
    end
  end

end
