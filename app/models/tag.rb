class Tag < ApplicationRecord
	has_many :picture_tags
	has_many :pictures, through: :picture_tags


	def self.most_popular
		Tag.all.sort_by do |tag|
			tag.pictures.length
		end.slice(0,3)
	end

	def self.trending
		recently_created = Tag.all.sort_by do |tag|
			tag.created_at
		end.slice(0..9).reverse
		blah = recently_created.sort_by do |tag|
			tag.pictures.length 
		end
		blah.reverse
	end



end
