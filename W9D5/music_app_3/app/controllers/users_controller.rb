class UsersController < ApplicationController

    def new
        render plain: "UsersController: New"
    end

    def create
        user = User.new(user_params)
        render plain: "UsersController: New"
        if user.save
            render plain: "#login(user)"
            render json: user
        else
            render json: "User not found", status: 401
        end
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user
    end

    def user_params
        params.require(:user).permit(:id, :email) 
        #password? #password_digest?
    end
end