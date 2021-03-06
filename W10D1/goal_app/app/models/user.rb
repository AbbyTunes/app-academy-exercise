class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence: true
    validates :password, length: { minimum: 6, allow_nil: true }
    validates :username, :session_token, uniqueness: true

    attr_reader :password

    after_initialize :ensure_session_token

    def self.find_by_credential(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.valid_password?(password)
        user 
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
        # SecureRandom::urlsafe_base64(16) # for session token
    end
    
    def reset_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end
    
    def valid_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
end

