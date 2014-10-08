class CropsController < ApplicationController

	def index
	  	@title = "Crop Details"
	  	@farm= FarmDetail.search(params[:search])
	  	logger.debug params
	 	if !@farm.nil?
	  		hold_selected_farm(@farm)
	  		@crops=@farm.crops
		else
			@crops = nil
		end
	end

	def new
		@newcrop = Crop.new
		@title = "New Crop"
	end

	def create
		@newcrop = selected_farm.crops.build(params[:crop])
	  	if @newcrop.save
	  		redirect_to crops_path(search: selected_farm.id), flash: {success: "Added new crop!"}
	  	else
	  		render 'new'
	  	end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	def home
		@title = "Crop Details"
	end

	def search
	  	logger.debug params[:crops][:farm_name]
	  	if params[:crops][:farm_name].blank?
	   	flash.now[:notice] = "Select a Farm to view Crop details"
	   	render 'home'
	 	else
	   	@farm = FarmDetail.find_by_farm_name(params[:crops][:farm_name])
	   	hold_selected_farm(@farm)
	  	 	redirect_to soils_path
	  	end
	end

	private
	   
	  	def correct_farm_crop_map
	    	@crop = Crop.find(params[:id])
	    	@farm = @crop.farm_detail            
	   	redirect_to home_crops_path unless selected_farm?(@farm)  
	  	end

end
