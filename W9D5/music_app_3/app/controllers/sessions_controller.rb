class SessionsController < ApplicationController
    # plural form

    # Unfinished

    def new # login page
        # render plain: "SessionsController: New"
        render :new
    end

    def create # log you in
        # render plain: "SessionsController: Create"

        @user = User.find_by_credentials(
            params[:user][:email], params[:user][:password]
        )
        if @user
            login(@user)
            render json: @user
        else
            render @user.errors.full_message, status: 401
        end
    end

    def destroy # log out
        # render plain: "SessionsController: Destroy"

        logout
        render json: "logged out successfully", status: 200
    end

    # def notes
    # end
end