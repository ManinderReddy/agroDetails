class SoilsController < ApplicationController
  def index
  	@title = "Soil Details"
    logger.debug "Soil index"
    logger.debug selected_farm.inspect
  	@soil_list = selected_farm.soils
  end

  def new
  	@title = "Add Soil Details"
  	@newsoil = Soil.new
  end

  def create
  	@newsoil = selected_farm.soils.build(params[:soil])
    logger.debug @newsoil
  	if @newsoil.save
  		redirect_to soils_path, flash: {success: "Added new soil details!"}
  	else
  		render 'new'
  	end
  end
end
