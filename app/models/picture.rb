class Picture < ApplicationRecord
	has_many :comments 
	has_many :picture_tags
	has_many :tags, through: :picture_tags
end
