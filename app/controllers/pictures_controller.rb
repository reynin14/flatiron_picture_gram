class PicturesController < ApplicationController

	def index
		@pictures = Picture.all
	end

	def show
		@picture = Picture.find_by(id: params[:id])
	end

	def new
		@picture = Picture.new
	end

	def create
		# @user = User.find_by(username: params[:username])
		@picture = Picture.new(picture_params)
		if @picture.save 
			redirect_to @picture
		else
			render :new
		end
	end

	private

	def picture_params
		params.require(:picture).permit(:image_url, :title, :user_id)
	end


end
