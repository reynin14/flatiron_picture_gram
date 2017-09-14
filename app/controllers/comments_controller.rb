class CommentsController < ApplicationController

  def index
    @comments = Picture.all
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    @user = User.find_by(id: @comment[:user_id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = params[:comment][:user_id]
    @comment.picture_id = params[:comment][:picture_id]
    @user = User.find_by(id: params[:comment][:user_id])
    @picture = Picture.find_by(id: params[:comment][:picture_id])
    if @comment.save
      redirect_to picture_path(@picture)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find_by(id: params[:id])
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @picture = Picture.find_by(id: @comment.picture_id)
    @comment.destroy
    redirect_to @picture
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
