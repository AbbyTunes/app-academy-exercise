class SessionsController < ApplicationController
    # plural form

    # Unfinished

    def new
        render plain: "SessionsController: New"
        # render :new
    end

    def create
        render plain: "SessionsController: Create"
        @user = User.find_by_credentials()
        if @user
            login(@user)
            render json: @user
        else
            render @user.errors.full_message, status: 401
        end
    end

    def destroy
        render plain: "SessionsController: Destroy"
        logout
        render json: "logged out successfully", status: 200
    end

    # def notes
    # end
end