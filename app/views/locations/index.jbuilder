json.array! @locations do |location|
	json.merge! location.to_builder_short.attributes!
end
