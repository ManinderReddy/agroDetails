class FertilizersController < ApplicationController
	before_filter :authenticate
	before_filter :user_farm_mapping, only: [:index]
	before_filter :user_crop_mapping, only: [:view]
	def index
		@title = "Fertilizer Details"
		if params[:search].present? && params[:year].present? 
		  	@farm= FarmDetail.search(params[:search])
		 	if !@farm.nil?
				cookies[:search] = params[:search]
				cookies[:year] = params[:year]
		  		hold_selected_farm(@farm)
		  		@crops=@farm.crops
			else
				cookies.delete :search
				cookies.delete :year
				@crops = nil
				flash.now[:notice] = "No Crops available for this search!"
			end
		elsif params[:search].blank? && params[:year].present?
		   flash.now[:notice] = "Please select a farm!"
		elsif params[:year].blank? && params[:search].present?
			flash.now[:notice] = "Please select a year!"
      end
	end

	def new
		@title = "New Fertilizer"
		@fertilizer = Fertilizer.new
	end

	def create
		@fertilizer = selected_crop.fertilizers.build(params[:fertilizer])
	  	if @fertilizer.save
	  		redirect_to view_fertilizers_path(crop_id: selected_crop.id), flash: {success: "Added new Fertilizer!"}
	  	else
	  		render 'new'
	  	end
	end

	def view
		@title = "Fertilizer Details"
		logger.debug params
	  	if params[:crop_id].present?
		  	@crop = Crop.search(params[:crop_id])
		 	if !@crop.nil?
		  		hold_selected_crop(@crop)
		  		@fertilizers=@crop.fertilizers
			else
				@fertilizers = nil
				flash.now[:notice] = "No Fertilizers are added!"
			end
		else
         redirect_to fertilizers_path, flash: {notice: "Select a Crop to view Fertilizers!"}
      end		
	end

	def edit_selected
      @title = "Edit Fertilizer"
      if params[:fertilizer_id].nil?
         redirect_to view_fertilizers_path(crop_id: selected_crop.id), flash: {notice: "Please select a Fertilizer to update!"}
      else
         @fertilizer = Fertilizer.find(params[:fertilizer_id])
         if params[:commit] == "Delete"
            @fertilizer.destroy()
            redirect_to view_fertilizers_path(crop_id: selected_crop.id), flash: {success: "Deleted Fertilizer!"} 
         end            
      end
   end

   def update_selected
      @fertilizer = Fertilizer.find(params[:fertilizer_id])
      if @fertilizer.update_attributes(params[:fertilizer])
         redirect_to view_fertilizers_path(crop_id: selected_crop.id), flash: {success: "Fertilizer details updated!"}
      else
         render 'edit_selected'
      end
   end


	private
		def user_farm_mapping
			if params[:search].present?
				@farm= FarmDetail.search(params[:search])
				if @farm.nil?
					redirect_to fertilizers_path
				else
					@user = @farm.user
					redirect_to fertilizers_path(search: nil) unless current_user?(@user)
				end
			end
		end

		def user_crop_mapping
			if params[:crop_id].present?
				@crop = Crop.search(params[:crop_id])
				if @crop.nil?
					redirect_to fertilizers_path
				else
					@user = @crop.user
					redirect_to fertilizers_path(search: nil) unless current_user?(@user)
				end
			end			
		end
end
