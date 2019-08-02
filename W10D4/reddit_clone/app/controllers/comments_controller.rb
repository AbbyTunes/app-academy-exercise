class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to 
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :author, :post, :comment_id)
  end
end
