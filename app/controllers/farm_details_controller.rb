class FarmDetailsController < ApplicationController
before_filter :authenticate

	def index
		@title = "Farm Details"
		@farm_details = current_user.farm_details
	end

	def new
		@title = "Add Farm Details"
		@newFarm = FarmDetail.new
	end

	def create
		@newFarm = current_user.farm_details.build(params[:farm_detail])
		if @newFarm.save
			redirect_to farm_details_path, flash:{success: "Added a new Farm!"}		
		else
			render 'new'
		end
		
	end

	def edit_selected
	   @title = "Edit Farm Details"

	   if params[:farm_id].nil?
	   	redirect_to farm_details_path, flash: {notice: "Please select a farm to update!"}
	   else
	   	@farm_details = FarmDetail.find(params[:farm_id])
	   	if params[:commit] == "Delete"
	   		@farm = FarmDetail.find(params[:farm_id])
				@farm.destroy()
				redirect_to farm_details_path, flash: {success: "Deleted Farm!"} 
	   	end	   		
		end
	end
	  
	def update_selected
		@farm_details = FarmDetail.find(params[:farm_id])
	   if @farm_details.update_attributes(params[:farm_detail])
			redirect_to farm_details_path, flash: {success: "Farm updated!"}
		else
			render 'edit_selected'
		end
	end

end
