# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord
    
    validates :email, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimun: 6}, allow_nil: true

    after_initialize :ensure_session_token
    attr_reader :password

    def self.find_by_credentials(email, password)
        @user = User.find_by(
            email: params[:user][:email]
            password: params[:user][:password]
        )

        @user = User.find_by(
            email: params[:user][:email],
            password: params[:user][:password]
            )

    end
    
    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
        SecureRandom::urlsafe_base64(16)
        SecureRandom::urlsafe_base64(16)
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        # store a brand new token in the database
        # class method self.class.generate_session_token
        self.update!(session_token: User.generate_session_token)
        # give back the user_instance.session_token
        self.session_token

        self.update!(session_token: self.class.generate_session_token)
        self.session_token

        self.session_token = SecureRandom::urlsafe_base64(16)
        self.save!
        self.session_token 

        self.session_token = self.class.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        # if null, assign one
        self.session_token ||= self.class.generate_session_token
        self.session_token ||= self.class.generate_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    # def password=(password)
    #     @password = password
    #     self.password_digest = BCrypt::Password.create(password)
    # end

    # def is_password?(password)
    #     bcrypt_pw = BCrypt::Password.new(self.password_digest)
    #     bcrypt_pw.is_password?(password)
    end

    def is_password?(password)
        bcrypt_pw = BCrypt::Password.new(self.password_digest)
        bcrypt_pw.is_password?(password)
    end

end
