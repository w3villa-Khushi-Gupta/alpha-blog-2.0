class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true, length: {minimum: 5, maximum: 30}
    # validates_presence_of :username
    # ABC = "hi my name is vikas" 

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 100}, format: {with: VALID_EMAIL_REGEX }

    validates :phone_no, presence: true, length: {minimum: 10, maximum: 10}

    has_secure_password
    has_many :articles, dependent: :destroy


    def get_user_name
        username
    end

    def self.get_all_name 
        User.pluck(:username)
    end
    
    def self.check_email_validation
        User.pluck(:email)
    end

    def self.check_valid_phone_no
       User.pluck(:phone_no)
    end


   
end
