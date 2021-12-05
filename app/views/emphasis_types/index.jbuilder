json.array! @emphasis_types do |emphasis_type|
	json.merge! emphasis_type.to_builder_short.attributes!
end
