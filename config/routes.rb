Rails.application.routes.draw do
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	resources :age_groups, path: '/age-groups'
	resources :area_types, path: '/area-types'
	resources :emphasis_types, path: '/emphasis-types'
	resources :locations
end
