class UserMailer < ApplicationMailer

    # default from "App Academy<contact@appacademy.io>"
    # inherit from parent class

    def welcome_email(user)
        # add attachments: add a new key/value pairs to the hash
        attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
        
        @user = user
        @url = 'http://example.com/login'
        mail(to: user.email, subject: 'Welcome to App Academy')
    end

end
