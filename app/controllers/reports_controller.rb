class ReportsController < ApplicationController
	def index
		logger.debug params
		case params[:search]
		when "Farms"
			redirect_to farm_reports_path
		when "Soils"
			redirect_to soil_reports_path
		when "Crops"
			redirect_to crop_reports_path
		# when "Fertilizers"
		# 	redirect_to fertilizers_report
		# when "Full Report"
		# 	redirect_to full_report							
		else
			flash.now[:notice] = "Select to view Report!" if !params[:search].nil?
		end
	end

	def farm
		if params[:from_date].present? && params[:to_date].present?
	    	@farm_details = current_user.farm_details.where("created_at between ? and ?", params[:from_date], params[:to_date])
	    	if !@farm_details.blank?
		  		farm_details_csv = FarmDetail.to_excel(@farm_details)
		  		send_data(farm_details_csv, type: 'text/csv', disposition: 'attachment', filename: 'Farm_Report.csv')
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   else
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash.now[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash.now[:notice] = "Select from date.."
	   	else
	   		flash.now[:notice] = "Select to date..."
	   	end
	   end
 	end

	def crop
		if params[:from_date].present? && params[:to_date].present?
	    	@crops = Crop.fetch_crops(current_user, params[:from_date], params[:to_date])
	    	if !@crops.blank?
	    		crop_details_csv = Crop.to_excel(@crops)  
		      send_data(crop_details_csv, :type => 'text/csv', :filename => 'Crop_Report.csv')
		      flash.now[:success] = "Successfully downloaded the report!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   else
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash.now[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash.now[:notice] = "Select from date.."
	   	else
	   		flash.now[:notice] = "Select to date..."
	   	end
	   end
	end

	def soil
		if params[:from_date].present? && params[:to_date].present?
	    	@soils = Soil.fetch_soils(current_user, params[:from_date], params[:to_date])
	    	if !@soils.blank?
		  		soil_details_csv = Soil.to_excel(@soils)
		      send_data(soil_details_csv, :type => 'text/csv', :filename => 'Soil_Report.csv')
		      flash.now[:success] = "Successfully downloaded the report!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   else
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash.now[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash.now[:notice] = "Select from date.."
	   	else
	   		flash.now[:notice] = "Select to date..."
	   	end
	   end
	end

	def download_report
		
	end

	def email_report
		
	end
end
