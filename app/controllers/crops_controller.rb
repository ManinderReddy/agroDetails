class CropsController < ApplicationController
before_filter :authenticate

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
	    	@crop = Crop.find(params[:id])
	    	@farm = @crop.farm_detail            
	   	redirect_to home_crops_path unless selected_farm?(@farm)  
	  	end

end
