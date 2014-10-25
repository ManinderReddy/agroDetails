class ReportsController < ApplicationController
before_filter :authenticate

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
		@from_date = params[:from_date] || nil
		@to_date = params[:to_date] || nil
		@file_path = get_download_path(params[:report_type])
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
	   	if File.exist?(@file_path)
		    	file = File.open(@file_path, "rb")
		    	contents = file.read
		    	file.close
		    	send_data(contents , :type => 'text/csv', :filename => 'farm_report.csv')
	    	else
      		flash.now[:error] = "Error! No file exists."
      	end
		elsif (params[:commit] == "Email Report")
	   	if File.exist?(@file_path)
      		ReportMailer.send_report(current_user, params[:report_type], @file_path).deliver
      		flash.now[:success] = "Emailed report Successfully..."
      	else
      		flash.now[:error] = "Error! No file exists."
      	end
	   end
 	end

	def crop
		@from_date = params[:from_date] || nil
		@to_date = params[:to_date] || nil
		@file_path = get_download_path(params[:report_type])

		if params[:commit] == "Submit"
			if params[:from_date].present? && params[:to_date].present?
				delete_report("crop")
		    	crop_file_path = Crop.create_csv_file(current_user,params[:from_date],params[:to_date])
		    	if crop_file_path.present?
		    		store_download_path(crop_file_path,"crop")
			  		flash.now[:success] = "Report generated. Click Download!"
			   else
			   	flash.now[:notice] = "No records over selected duration!"
			   end
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
		elsif (params[:commit] == "Download Report")
	    	if File.exist?(@file_path)
		    	file = File.open(@file_path, "rb")
		    	contents = file.read
		    	file.close
		    	send_data(contents , :type => 'text/csv', :filename => 'crop_report.csv')
	    	else
      		flash.now[:error] = "Error! No file exists."
      	end
	   elsif (params[:commit] == "Email Report")
	   	if File.exist?(@file_path)
      		ReportMailer.send_report(current_user, params[:report_type], @file_path).deliver
      		flash.now[:success] = "Emailed report Successfully..."
      	else
      		flash.now[:error] = "Error! No file exists."
      	end
	   end
	end

	def soil
		@from_date = params[:from_date] || nil
		@to_date = params[:to_date] || nil
		@file_path = get_download_path(params[:report_type]) || nil

		if params[:commit] == "Submit"
			if params[:from_date].present? && params[:to_date].present?
		    	delete_report("soil")
		    	soil_file_path = Soil.create_csv_file(current_user,params[:from_date],params[:to_date])
		    	if soil_file_path.present?
		    		store_download_path(soil_file_path,"soil")
			  		flash.now[:success] = "Report generated. Click Download!"
			   else
			   	flash.now[:notice] = "No records over selected duration!"
			   end
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
		elsif (params[:commit] == "Download Report")
	   	if File.exist?(@file_path)
		    	file = File.open(@file_path, "rb")
		    	contents = file.read
		    	file.close
		    	send_data(contents , :type => 'text/csv', :filename => 'soil_report.csv')
	    	else
      		flash.now[:error] = "Error! No file exists."
      	end
		elsif (params[:commit] == "Email Report")
	   	if File.exist?(@file_path)
      		ReportMailer.send_report(current_user, params[:report_type], @file_path).deliver
      		flash.now[:success] = "Emailed report Successfully..."
      	else
      		flash.now[:error] = "Error! No file exists."
      	end
	   end
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
