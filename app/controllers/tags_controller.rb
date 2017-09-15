class TagsController < ApplicationController

	def index
	end

	def show
		@tag = Tag.find_by(id: params[:id])
	end

	def create
		@tag = Tag.find_or_create_by(name: params[:name])
		if @tag.save
			@picture_tag = PictureTag.new(picture_id: params[:picture_id], tag_id: @tag.id)
			@picture_tag.save
			@picture = Picture.find_by(id: params[:picture_id])
			redirect_to @picture
		else
			render :new
		end
	end

	def destroy
		@picture = Picture.find_by(id: params[:picture_id])
		@picture_tag = PictureTag.find_by(picture_id: params[:picture_id], tag_id: params[:tag_id])
		@picture_tag.delete
		redirect_to @picture
	end

	private
	#
	# def tag_params
	# 	# params.require(:tag).permit(:name)
	# end

end
