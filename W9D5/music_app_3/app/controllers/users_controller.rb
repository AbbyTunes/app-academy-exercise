class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
        # render plain: "UsersController: New"
    end

    def create
        user = User.new(user_params)
        # render plain: "UsersController: New"

        if user.save
            # msg = UserMailer.welcome_email(u)
            # msg .deliver_now
            
            login(user)
            render json: user
        else
            render user.errors.full_message, status: 401
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def user_params
        params.require(:user).permit(:id, :email, :password_digest) 
    end
end