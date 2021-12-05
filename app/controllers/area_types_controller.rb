# frozen_string_literal: true

class AreaTypesController < ApplicationController

	def index
		@area_types = AreaType.order(:display_order)
	end

	def show
		@area_type = AreaType.find(params[:id])
	end

end
