class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find_by(id: params[:id])

		@pictags = PictureTag.all.select do |pictag|
			pictag.picture_id == @picture.id
		end

		@tags = Tag.all

		@comments = Comment.all.select do |comment|
			comment.picture_id == @picture.id
		end
		@user = User.find_by(id: session[:user_id])
	end

	def new
		@picture = Picture.new
		@user = User.find_by(id: session[:user_id])
	end

	def create
		@picture = Picture.new(picture_params)
		@picture.user_id = session[:user_id]
		@user = User.find_by(id: session[:user_id])
		if @picture.save
			redirect_to @user
		else
			render :new
		end
	end

	def destroy
    @picture = Picture.find(params[:id])
    @user = User.find_by(id: @picture.user_id)
    @picture.destroy
    redirect_to @user
    end

	private

	def picture_params
		params.require(:picture).permit(:image_url, :title, :user_id)
	end


end
