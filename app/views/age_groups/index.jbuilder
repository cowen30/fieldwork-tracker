json.array! @age_groups do |age_group|
	json.merge! age_group.to_builder_short.attributes!
end
