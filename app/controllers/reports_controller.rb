class ReportsController < ApplicationController
# before_filter :delete_temp_files

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
			flash.now[:notice] = "Select to Report!" if !params[:search].nil?
		end
	end

	def farm
		if params[:commit] == "Submit"
			if params[:from_date].present? && params[:to_date].present?
				delete_report("farm")
		    	farm_file_path = FarmDetail.create_csv_file(current_user,params[:from_date],params[:to_date])
		    	if farm_file_path.present?
		    		store_download_path(farm_file_path,"farm")
			  		flash.now[:success] = "Report generated. Click Download!"
			   else
			   	flash.now[:notice] = "No records over selected duration!"
			   end
			else
		   	delete_report("farm")
		   	if params[:from_date].blank? && params[:to_date].blank?
		   		flash.now[:notice] = "Select from and to date.."
		   	elsif params[:from_date].blank?
		   		flash.now[:notice] = "Select from date.."
		   	else
		   		flash.now[:notice] = "Select to date..."
		   	end
			end
	   elsif (params[:commit] == "Download Report")
	   	path = get_download_path("farm")
	    	file = File.open(path, "rb")
	    	contents = file.read
	    	file.close
	    	send_data(contents , :type => 'text/csv', :filename => 'farm_report.csv')
	   end
 	end

	def crop
		if params[:from_date].present? && params[:to_date].present?
			delete_report("crop")
	    	crop_file_path = Crop.create_csv_file(current_user,params[:from_date],params[:to_date])
	    	if crop_file_path.present?
	    		store_download_path(crop_file_path,"crop")
		  		flash.now[:success] = "Report generated. Click Download!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   elsif (params[:download_report].present? && params[:download_report])
	   	path = get_download_path("crop")
	    	file = File.open(path, "rb")
	    	contents = file.read
	    	file.close
	    	send_data(contents , :type => 'text/csv', :filename => 'crop_report.csv')
	   else
	   	delete_report("crop")
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
	    	delete_report("soil")
	    	soil_file_path = Soil.create_csv_file(current_user,params[:from_date],params[:to_date])
	    	if soil_file_path.present?
	    		store_download_path(soil_file_path,"soil")
		  		flash.now[:success] = "Report generated. Click Download!"
		   else
		   	flash.now[:notice] = "No records over selected duration!"
		   end
	   elsif (params[:download_report].present? && params[:download_report])
	   	path = get_download_path("soil")
	    	file = File.open(path, "rb")
	    	contents = file.read
	    	file.close
	    	send_data(contents , :type => 'text/csv', :filename => 'soil_report.csv')
	   else
	   	delete_report("soil")
	   	if params[:from_date].blank? && params[:to_date].blank?
	   		flash.now[:notice] = "Select from and to date.."
	   	elsif params[:from_date].blank?
	   		flash.now[:notice] = "Select from date.."
	   	else
	   		flash.now[:notice] = "Select to date..."
	   	end
	   end
	end

	def email
		file_path = get_download_path(params[:report_type])
	   ReportMailer.send_report(current_user, "farm",file_path).deliver 
	   redirect_to farm_reports_path, flash: {success: "Successfully Emailed report!"}
	end
	
 	private

 	def delete_report(report_name)
 		file_path= get_download_path(report_name)
 		if (file_path.present? && File.exist?(file_path))
 			File.delete(file_path)
 			clear_download_path(report_name)
 		end
 	end

end
