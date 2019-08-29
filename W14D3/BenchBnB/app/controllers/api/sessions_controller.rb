class Api::SessionsController < ApplicationController

  def create
        user = User.find_by_credentials(
            params[:user][:username], params[:user][:password]
        )
        if user
            login(user) 
            render "api/users/show"
        else
            render json: ["wrong username/password combo"], status: 401
        end        
    end

    def destroy
        logout
        render "api/session/show" # login page
    end
end
