# == Schema Information
#
# Table name: soils
#
#  id                 :integer          not null, primary key
#  farm_detail_id     :integer
#  soil_type          :string(255)
#  soil_texture       :string(255)
#  water_availability :string(255)
#  soil_ph            :string(255)
#  soil_biota         :string(255)
#  season             :string(255)
#  year_of_details    :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Soil < ActiveRecord::Base


	attr_accessible :soil_type, :soil_texture, :soil_biota, :soil_ph,
						 :water_availability, :season, :year_of_details

	
	validates :soil_type, presence: true
	validates :soil_texture, presence: true
	validates :water_availability, presence: true
	validates :season, presence: true
	validates :year_of_details, presence: true

	belongs_to :farm_detail

	default_scope  { order(created_at: :desc) }

	# def self.fetch_soils(user,from_date,to_date)
	# 	@soils = user.soils.where("soils.created_at between ? and ?", from_date,to_date)
	# 	(@soils.blank?) ? nil : @soils
	# end

	def self.create_csv_file(user,from_date,to_date)
		@soils = user.soils.where("soils.created_at between ? and ?", from_date,to_date)
		if !@soils.blank?
    		file_path = "#{Rails.root}/tmp/soil_report_#{user.id}.csv"
    		CSV.open(file_path, "w+") do |csv|
		    	csv << ["Farm Name", "Soil Type","Soil Texture", "Water Availability", "Soil pH", "Soil is Rich in", "Season", "Year of Details"]
		    	@soils.each do |soil|
		    		farm = soil.farm_detail
		      	csv << [farm.farm_name, farm.soil_type, soil.soil_texture, soil.water_availability, soil.soil_ph, soil.soil_biota, soil.season,soil.year_of_details] 
		      end  
		   end
      end 
      (file_path) ? file_path : nil 
	end

end
