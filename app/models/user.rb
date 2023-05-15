class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: {minimum: 5, maximum: 100}
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100}, format: {with: VALID_EMAIL_REGEX }
    
    validates :phone_no, presence: true, length: {minimum: 10, maximum: 10}

    has_secure_password
    has_many :articles, dependent: :destroy
end
