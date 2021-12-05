json.array! @area_types do |area_type|
	json.merge! area_type.to_builder_short.attributes!
end
