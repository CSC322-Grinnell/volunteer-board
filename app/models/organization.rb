class Organization < ApplicationRecord
before_create :confirmation_token
end
