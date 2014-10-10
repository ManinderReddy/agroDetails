class CropsController < ApplicationController
before_filter :authenticate
before_filter :correct_farm_crop_map, only: [:edit_selected]

	def index
	  	@title = "Crop Details"
	  	if !params[:search].blank?
		  	@farm= FarmDetail.search(params[:search])
		 	if !@farm.nil?
		  		hold_selected_farm(@farm)
		  		@crops=@farm.crops
			else
				@crops = nil
			end
		else
         flash.now[:notice] = "Please select a farm!"
      end
	end

	def new
		@title = "New Crop"
		@crop = Crop.new		
	end

	def create
		@crop = selected_farm.crops.build(params[:crop])
	  	if @crop.save
	  		redirect_to crops_path(search: selected_farm.id), flash: {success: "Added new crop!"}
	  	else
	  		render 'new'
	  	end
	end

   def edit_selected
      @title = "Edit Crop"
      if params[:crop_id].nil?
         redirect_to crops_path(search: selected_farm.id), flash: {notice: "Please select a Crop to update!"}
      else
         @crop = Crop.find(params[:crop_id])
         if params[:commit] == "Delete"
            @crop.destroy()
            redirect_to crops_path(search: selected_farm.id), flash: {success: "Deleted crop!"} 
         end            
      end
   end
     
   def update_selected
      @crop = Crop.find(params[:crop_id])
      if @crop.update_attributes(params[:crop])
         redirect_to crops_path(search: selected_farm.id), flash: {success: "Crop details updated!"}
      else
         render 'edit_selected'
      end
   end


	private
	   
	  	def correct_farm_crop_map
	  		if !params[:crop_id].blank?
	    		@crop = Crop.find(params[:crop_id])
	    		@farm = @crop.farm_detail            
	   		redirect_to home_crops_path unless selected_farm?(@farm)  
	   	end
	  	end

end
