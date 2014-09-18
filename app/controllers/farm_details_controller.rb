class FarmDetailsController < ApplicationController
before_filter :authenticate

	def home
		@title = "Farm Details"		
	end

	def new
		@title = "Add Farm Details"
		@newFarm = FarmDetail.new
	end

	def create
		@newFarm = current_user.farm_details.build(params[:farm_detail])
		if @newFarm.save
			render 'home', flash:{success: "Added new Farm!"}		
		else
			render 'new'
		end
		
	end

	def edit
		@title = "Edit Farm Details"
	end

	def update
		
	end

	def destroy

	end


end
