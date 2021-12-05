# frozen_string_literal: true

class EmphasisTypesController < ApplicationController

	def index
		@emphasis_types = EmphasisType.order(:display_order)
	end

	def show
		@emphasis_type = EmphasisType.find(params[:id])
	end

end
