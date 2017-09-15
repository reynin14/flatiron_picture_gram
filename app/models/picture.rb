class Picture < ApplicationRecord
	has_many :comments
	has_many :picture_tags
	has_many :tags, through: :picture_tags

	validates :image_url, presence: true
	validate :http_format?

	def http_format?
		if !self.image_url.include?("http")
		else
			errors.add(:image_url, "Must include http")
		end
	end
end
