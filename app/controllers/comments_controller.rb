class CommentsController < ApplicationController

  def index
    @comments = Picture.all
  end

  def show
    @comment = Comment.find_by(id: params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.picture_id =
    @user = User.find_by(id: session[:user_id])
    if @comment.save
      redirect_to @
    else
      render :new
    end
  end

  private

  def picture_params
    params.require(:comment).permit(:content)
  end

end
