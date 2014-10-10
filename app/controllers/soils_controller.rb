class SoilsController < ApplicationController
before_filter :authenticate
before_filter :correct_farm_soil_map, only: [:edit_selected]
before_filter :validate_farm, only: [:new]

   def index
  	   @title = "Soil Details"
      if !params[:search].blank?
         @farm= FarmDetail.search(params[:search])
         logger.debug params
         if !@farm.nil?
            hold_selected_farm(@farm)
            @soil_list = @farm.soils
         else
            @soil_list = nil
         end
      else
         flash.now[:notice] = "Please select a farm!"
      end
   end

   def new
  	   @title = "New Soil Details"
      @newsoil = Soil.new    
   end

   def create    
      @newsoil = selected_farm.soils.build(params[:soil])
    
  	   if @newsoil.save
  		   redirect_to soils_path(search: selected_farm.id), flash: {success: "Added new soil details!"}
  	   else
  		   render 'new'
  	   end
   end

   def edit_selected
      @title = "Edit Soil"
      if params[:soil_id].nil?
         redirect_to soils_path(search: selected_farm.id), flash: {notice: "Please select a Soil to update!"}
      else
         @soil = Soil.find(params[:soil_id])
         if params[:commit] == "Delete"
            @soil.destroy()
            redirect_to soils_path(search: selected_farm.id), flash: {success: "Deleted Soil!"} 
         end            
      end
   end
     
   def update_selected
      @soil = Soil.find(params[:soil_id])
      if @soil.update_attributes(params[:soil])
         redirect_to soils_path(search: selected_farm.id), flash: {success: "Soil details updated!"}
      else
         render 'edit_selected'
      end
   end

   private
    
      def correct_farm_soil_map
         if !params[:soil_id].blank?
            @soil = Soil.find(params[:soil_id])
            @farm = @soil.farm_detail            
            redirect_to home_soils_path unless selected_farm?(@farm) 
         end
      end

      def validate_farm
         @user = selected_farm.user if !selected_farm.nil?
         redirect_to home_soils_path unless current_user?(@user)      
      end
end
