class User < ApplicationRecord
	has_many :pictures

	def received_comments
		# Go through all of the users pictures
		# Gather all of the comments from those pictures
		# Don't include self.user comments
		# self.pictures.map do |picture|
		# 	picture.comments.select do |comment|
		# 		comment.user_id != self.id
		# 	end
		# end
		user_comments = []
		self.pictures.each do |picture|
			user_comments << picture.comments
		end

		user_comments.flatten
	end

end
