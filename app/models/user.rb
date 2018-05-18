class User < ActiveRecord::Base
    has_many :new, dependent: :destroy
    has_many :comments, dependent: :destroy
    attr_accessor :password 
    VALID_USERNAME_REGEX = /\A[a-z0-9\-_]+\z/i
    validates :username, :presence => true, :uniqueness => true, :length => {:in => 2..15}, format: { with: VALID_USERNAME_REGEX }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, :uniqueness => true, format: { with: VALID_EMAIL_REGEX }
    
    VALID_PASSWORD_REGEX = /(?=.*?[^0-9A-Za-z])^(?=.*?[A-Z])^(?=.*?[a-z])^(?=.*?[0-9])/
    validates :password, :confirmation => true, :length => {:minimum => 10}, format: { with: VALID_PASSWORD_REGEX }
    # validates_length_of :password, :in => 6..20, :on => :create
    
    before_save :encrypt_password
    after_save :clear_password
    
    def encrypt_password
        if password.present?
          self.salt = BCrypt::Engine.generate_salt
          self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
        end
    end
    
    def clear_password
        self.password = nil
    end
    
    def self.authenticate(username_or_email="", login_password="")
      if  VALID_EMAIL_REGEX.match(username_or_email)    
        user = User.find_by_email(username_or_email)
      else
        user = User.find_by_username(username_or_email)
      end
      if user && user.match_password(login_password)
        return user
      else
        return false
      end
    end   
    
    def match_password(login_password="")
      encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
    end
end
