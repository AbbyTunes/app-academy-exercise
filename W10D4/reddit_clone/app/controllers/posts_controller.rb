class PostsController < ApplicationController

  before_action :ensure_log_in, except: [:show]
  before_action :require_user_owns_post!, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post) # post_show or subs_index
    else
      flash.now[:errors] = @post.errors.full_messages # now or not now
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])    
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params) 
      # update return the object # t/f
      # .update_attributes return false if not save, returen object if saved    
      redirect_to post_url(@post) # post_show
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by(id: params[:id])    
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url(@post.sub_id)
  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id[]) 
    # or :subs? just don't understand (the limit does not exist)
  end

  def require_user_owns_post!
    return if current_user.posts.find_by(id: params[:id])
    render json: 'Forbidden', status: :forbidden
  end
end