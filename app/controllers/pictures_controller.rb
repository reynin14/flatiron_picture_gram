class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find_by(id: params[:id])
		@comments = Comment.all
	end

	def new
		@picture = Picture.new
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

	private

	def picture_params
		params.require(:picture).permit(:image_url, :title, :user_id)
	end


end
