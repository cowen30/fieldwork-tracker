class AreaType < ApplicationRecord

	belongs_to :created_by, class_name: 'User', foreign_key: 'created_by'
	belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by'

	def to_builder
		Jbuilder.new do |area_type|
			area_type.(self, :id, :name, :display_order)
			area_type.created_at created_at
			area_type.created_by created_by.to_builder_short
			area_type.updated_at updated_at
			area_type.updated_by updated_by.to_builder_short
		end
	end

	def to_builder_short
		Jbuilder.new do |area_type|
			area_type.(self, :id, :name)
		end
	end

end
