# frozen_string_literal: true

class AgeGroupsController < ApplicationController

	def index
		@age_groups = AgeGroup.order(:display_order)
	end

	def show
		@age_group = AgeGroup.find(params[:id])
	end

end
