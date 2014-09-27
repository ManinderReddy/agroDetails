class SoilsController < ApplicationController
before_filter :authenticate
before_filter :correct_user_farm

  def index
  	@title = "Soil Details"    
    session[:farm_id] = params[:farm_id]       
    @farm = FarmDetail.fetch_farm(session[:farm_id])
    @soil_list = @farm.soils
  end

  def new
  	@title = "Add Soil Details"
    @newsoil = Soil.new    
  end

  def create    
    @farm = FarmDetail.find(session[:farm_id])
  	@newsoil = @farm.soils.build(params[:soil])
    
  	if @newsoil.save
  		redirect_to soils_path(farm_id: @farm.id), flash: {success: "Added new soil details!"}
  	else
  		render 'new'
  	end
  end

  private
    
    def correct_user_farm
      @farm = FarmDetail.fetch_farm(params[:farm_id] || session[:farm_id])      
      @user = @farm.user if !@farm.nil?
      redirect_to farm_details_path unless current_user?(@user)      
    end
end
