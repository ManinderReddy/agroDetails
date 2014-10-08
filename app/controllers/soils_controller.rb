class SoilsController < ApplicationController
before_filter :authenticate
before_filter :correct_farm_soil_map, only: [:edit]
before_filter :validate_farm, only: [:new]

  def index
  	@title = "Soil Details"    
    @soil_list = selected_farm.soils
  end

  def new
  	@title = "New Soil Details"
    @newsoil = Soil.new    
  end

  def create    
    @newsoil = selected_farm.soils.build(params[:soil])
    
  	if @newsoil.save
  		redirect_to soils_path, flash: {success: "Added new soil details!"}
  	else
  		render 'new'
  	end
  end

  def edit
    @title = "Edit Soil Details"
    @soil = Soil.find(params[:id])
  end

  def update
    @soil = Soil.find(params[:id])
    if @soil.update_attributes(params[:soil])
      redirect_to soils_path, flash: {success: "Successfully updated!"}
    else
      render 'edit'
    end
  end

  def destroy
    @soil = Soil.find(params[:id])
    @soil.destroy()    
    redirect_to soils_path, flash: {success: "Successfuly deleted!"}
  end

  def home
   @title = "Soil Details"
  end

  def search
    logger.debug params[:soils][:farm_name]
    if params[:soils][:farm_name].blank?
      flash.now[:notice] = "Select a Farm to view Soil details"
      render 'home'
    else
      @farm = FarmDetail.find_by_farm_name(params[:soils][:farm_name])
      hold_selected_farm(@farm)
      redirect_to soils_path
    end
  end

  private
    
    def correct_farm_soil_map
      @soil = Soil.find(params[:id])
      @farm = @soil.farm_detail            
      redirect_to home_soils_path unless selected_farm?(@farm)  
    end

    def validate_farm
      @user = selected_farm.user if !selected_farm.nil?
      redirect_to home_soils_path unless current_user?(@user)      
    end
end
