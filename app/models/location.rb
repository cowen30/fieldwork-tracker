class Location < ApplicationRecord

	belongs_to :user
	belongs_to :emphasis_type
	belongs_to :area_type
	belongs_to :age_group
	belongs_to :created_by, class_name: 'User', foreign_key: 'created_by'
	belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by'

	def to_builder
		Jbuilder.new do |location|
			location.(self, :id, :name)
			location.user user.to_builder_short
			location.emphasis_type emphasis_type.to_builder_short
			location.area_type area_type.to_builder_short
			location.age_group age_group.to_builder_short
			location.created_at created_at
			location.created_by created_by.to_builder_short
			location.updated_at updated_at
			location.updated_by updated_by.to_builder_short
		end
	end

	def to_builder_short
		Jbuilder.new do |location|
			location.(self, :id, :name)
		end
	end

end
