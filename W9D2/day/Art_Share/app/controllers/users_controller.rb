class UsersController < ApplicationController

    def index
        #  render plain: "I'm in the index action!"
        render :users
        # @users = User.all 
        # render json: @users
    end
    
    def create
        # render plain: "I'm in the create action!"
        @users = User.new(user_params) 
        if @users.save!
            render json: user_params
        else 
            render json: users.errors.full_messagess, status: 422
        end    
    end

    def destroy
        # render plain: "I'm in the create action!"
        @user = User.find(params[:id])
        if @user.destroy
            render plain: "no more"
        else  
            render json: users.errors.full_messagess, status: 422
        end    
    end
    
    def show
        # render plain: "I'm in the show action!"
        # render json: params
        
        @users = User.find(params[:id])  
        render json: @users  
    end
    
    private 
    
    def user_params 
        params.require(:user).permit(:username) 
    end 
    
    def edit
        render plain: "I'm in the edit action!"
        # @users = User.all 
        # render json: @users
    end
end