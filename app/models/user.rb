class User < ApplicationRecord

	def to_builder_short
		Jbuilder.new do |user|
			user.(self, :id, :first_name, :last_name)
		end
	end

end
