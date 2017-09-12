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
		@picture = Picture.new(picture_params)
		if @picture.save
			@picture.user_id = @user.id
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
