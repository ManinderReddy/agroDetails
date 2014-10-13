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
		when "Fertilizers"
			redirect_to fertilizers_report
		when "Full Report"
			redirect_to full_report							
		else
			flash.now[:notice] = "Select to view Report!" if !params[:search].nil?
		end
	end

	def farm
		logger.debug params
		if params[:from_date].present? && params[:to_date].present?
	    	@farm_details = current_user.farm_details.where("created_at between ? and ?", params[:from_date], params[:to_date])
	    	if !@farm_details.blank?
		  		farm_details_csv = CSV.generate do |csv|
		    	csv << ["Farm Name", "Farm Area", "Farm Address", "Description"]
			    	@farm_details.each do |farm|
			      	csv << [farm.farm_name, farm.farm_area, farm.soil_type, farm.farm_description] 
			      end  
		      end   
		      send_data(farm_details_csv, :type => 'text/csv', :filename => 'farm_details.csv')
		   	flash.now[:notice] = "Successfully downloaded the report!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   else
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash[:notice] = "Select from date.."
	   	else
	   		flash[:notice] = "Select to date..."
	   	end
	   end
 	end

	def crop
		logger.debug params
		if params[:from_date].present? && params[:to_date].present?
	    	@crops = Crop.find_by_sql "SELECT c.* FROM crops c, farm_details f, users u WHERE c.farm_detail_id = f.id and f.user_id = u.id and u.id=#{current_user.id} and c.created_at between '#{params[:from_date]}' and '#{params[:to_date]}'"
	    	logger.debug @crops
	    	if !@crops.blank?
		  		crop_details_csv = CSV.generate do |csv|
		    	csv << ["Farm Name", "Soil Type","Crop Name", "Acarage", "Season", "Farm Start Date", "Farm End Date", "Expected Yeild", "Actual Yeild", "Other Details"]
			    	@crops.each do |crop|
			    		farm = crop.farm_detail
			      	csv << [farm.farm_name, farm.soil_type, crop.crop_name, crop.crop_acarage, crop.season, crop.from_date, crop.to_date, crop.expected_yeild, crop.actual_yeild, crop.Other_details] 
			      end  
		      end   
		      send_data(crop_details_csv, :type => 'text/csv', :filename => 'crop_details.csv')
		      flash.now[:notice] = "Successfully downloaded the report!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   else
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash[:notice] = "Select from date.."
	   	else
	   		flash[:notice] = "Select to date..."
	   	end
	   end
	end

	def soil
		logger.debug params
		if params[:from_date].present? && params[:to_date].present?
	    	@soils = Soil.find_by_sql "SELECT s.* FROM soils s, farm_details f, users u WHERE s.farm_detail_id = f.id and f.user_id = u.id and u.id=#{current_user.id} and s.created_at between '#{params[:from_date]}' and '#{params[:to_date]}'"
	    	logger.debug @soils
	    	if !@soils.blank?
		  		soil_details_csv = CSV.generate do |csv|
		    	csv << ["Farm Name", "Soil Type","Soil Texture", "Water Availability", "Soil pH", "Soil is Rich in", "Season", "Year of Details"]
			    	@soils.each do |soil|
			    		farm = soil.farm_detail
			      	csv << [farm.farm_name, farm.soil_type, soil.soil_texture, soil.water_availability, soil.soil_ph, soil.soil_biota, soil.season,soil.year_of_details] 
			      end  
		      end   
		      send_data(soil_details_csv, :type => 'text/csv', :filename => 'soil_details.csv')
		      flash.now[:notice] = "Successfully downloaded the report!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   else
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash[:notice] = "Select from date.."
	   	else
	   		flash[:notice] = "Select to date..."
	   	end
	   end
	end

	def fertilizer
		
	end

	def full
		
	end
end
