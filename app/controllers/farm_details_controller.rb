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
	   #riase params.inspect
	   if params[:farm_id].nil?
	   	redirect_to farm_details_path, flash: {notice: "Please select a farm to update!"}
	   else
	   	@farm_details = FarmDetail.find(params[:farm_id])
	   	#Find the below methods in farm details helper
	   	# clear_selected_farm

	   	# hold_selected_farm(@farm_details)

	   	if params[:commit] == "Delete"
	   		@farm = FarmDetail.find(params[:farm_id])
				@farm.destroy()
				redirect_to farm_details_path, flash: {success: "Deleted Farm!"} 
	   	elsif params[:commit] == "View Soil"
	   		redirect_to soils_path(farm_id: @farm_details.id)
	   	end	   		
		end
	end
	  
	def update_selected
		@farm_details = FarmDetail.find(params[:farm_id])
		# raise @farm_details.inspect
	   if @farm_details.update_attributes(params[:farm_detail])
			redirect_to farm_details_path, flash: {success: "Farm updated!"}
		else
			render 'edit_selected'
		end
	end

end
