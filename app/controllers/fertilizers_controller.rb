class FertilizersController < ApplicationController
	before_filter :authenticate
	before_filter :user_farm_mapping
	def index
		@title = "Fertilizer Details"
		if params[:search].present? && params[:year].present? 
		  	@farm= FarmDetail.search(params[:search])
		 	if !@farm.nil?
		  		hold_selected_farm(@farm)
		  		@crops=@farm.crops
			else
				@crops = nil
				flash.now[:notice] = "No Crops available for this search!"
			end
		elsif params[:search].blank? && params[:year].present?
		   flash.now[:notice] = "Please select a farm!"
		elsif params[:year].blank? && params[:search].present?
			flash.now[:notice] = "Please select a year!"
      end
	end

	private
		def user_farm_mapping
			if params[:search].present?
				@farm= FarmDetail.search(params[:search])
				@user = @farm.user
				redirect_to fertilizers_path(search: nil) unless current_user?(@user)
			end
		end
end
