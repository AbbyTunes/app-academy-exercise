class SubsController < ApplicationController

  before_action :ensure_log_in, except: [:show]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[error] = @sub.errors.full_messages
      render :something
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
  end

  def edit
    @sub = Sub.find_by(id: params[:id])    
  end

  def update
    @sub = Sub.find_by(id: params[:id]) # don't have to find the current_user?
    if @sub.update(sub_params)
      redirect_to sub_url(@sub) 
    else
      flash.now[error] = @sub.errors.full_messages
      render :edit
    end 
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description) # post_id? no direct foreign_key
  end
  
end
