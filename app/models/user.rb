class User < ApplicationRecord
	has_secure_password
	has_many :pictures
	has_many :followers

	validates :email, uniqueness: true
	validates :username, uniqueness: true

	def received_comments
		user_comments = []
		self.pictures.each do |picture|
			user_comments << picture.comments
		end

		user_comments.flatten
	end

end
