class AgeGroup < ApplicationRecord

	belongs_to :created_by, class_name: 'User', foreign_key: 'created_by'
	belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by'

	def to_builder
		Jbuilder.new do |age_group|
			age_group.(self, :id, :name, :display_order)
			age_group.created_at created_at
			age_group.created_by created_by.to_builder_short
			age_group.updated_at updated_at
			age_group.updated_by updated_by.to_builder_short
		end
	end

	def to_builder_short
		Jbuilder.new do |age_group|
			age_group.(self, :id, :name)
		end
	end

end
