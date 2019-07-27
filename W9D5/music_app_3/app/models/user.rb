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
    end
    
    def self.generate_session_token
    end

    def reset_session_token!
    end
    def ensure_session_token
    end

    def password=(password)
    end

    def is_password?(password)
    end

end
