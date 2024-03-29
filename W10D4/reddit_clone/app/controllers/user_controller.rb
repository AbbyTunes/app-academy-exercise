  class UserController < ApplicationController
    

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to subs_url # subs_index or user_show
    else
      flash.now[errors] = @user.errors.full_messages
      render :new
    end

  end


  private 
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
