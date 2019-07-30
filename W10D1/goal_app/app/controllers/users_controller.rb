class UsersController < ApplicationController
    def new
        user = User.new
        render :new
    end

    def show
        user = User.find(params[:id])
    end

    def create
        user = User.new(user_params)
        debugger
        if user.save
            redirect_to user_url(user.id)
        else
            flash[:errors] = user.errors.full_messages
            # redirect_to new_user_url
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
