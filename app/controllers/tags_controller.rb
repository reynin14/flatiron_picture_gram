class TagsController < ApplicationController

	def index
		@tags = Tag.all
	end

	def show
		@tag = Tag.find_by(id: params[:id])
	end

	def create
		@tag = Tag.new(id_params)
		if @tag.save 
			redirect_to tag_path(@tag)
		else
			render :new 
		end
	end

	private 

	def id_params
		params.require(:tag).permit(:name)
	end

end
