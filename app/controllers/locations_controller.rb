# frozen_string_literal: true

class LocationsController < ApplicationController

	def index
		params.deep_transform_keys!(&:underscore)
		@locations = Location.all
		@locations = @locations.where('name ILIKE ?', "%#{params[:name]}%") if params[:name].present?
		@locations = @locations.where(user_id: params[:user_id]) if params[:user_id].present?
		@locations = @locations.where(emphasis_type_id: params[:emphasis_type_id]) if params[:emphasis_type_id].present?
		@locations = @locations.where(area_type_id: params[:area_type_id]) if params[:area_type_id].present?
		@locations = @locations.where(age_group_id: params[:age_group_id]) if params[:age_group_id].present?
	end

	def show
		@location = Location.find(params[:id])
	end

	def create
		@location = Location.new(location_params)
		@current_user = User.find(1)
		@location.created_by = @current_user
		@location.updated_by = @current_user
		unless @location.save
			puts @location.errors.full_messages
			render json: { message: 'An unexpected error has occurred.' }, status: :internal_server_error
		end
	end

	def update
		@location = Location.find(params[:id])
		@current_user = User.find(1)
		@location.assign_attributes(location_params.merge(updated_by: @current_user))
		unless @location.save
			puts @location.errors.full_messages
			render json: { message: 'An unexpected error has occurred.' }, status: :internal_server_error
		end
	end

	private

	def location_params
		params.deep_transform_keys!(&:underscore).require(:location).permit(:id, :name, :user_id, :emphasis_type_id, :area_type_id, :age_group_id)
	end

end
