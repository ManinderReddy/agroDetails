# == Schema Information
#
# Table name: farm_details
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  farm_area        :float
#  farm_address     :string(255)
#  farm_description :text
#  created_at       :datetime
#  updated_at       :datetime
#  farm_city        :string(255)
#  farm_state       :string(255)
#  farm_name        :string(255)
#  soil_type        :string(255)
#

class FarmDetail < ActiveRecord::Base

	attr_accessible :farm_area, :farm_address, :farm_description, 
						:farm_name, :soil_type, :farm_city, :farm_state

	validates :user_id, presence: true
	validates :farm_name, presence: true,
								 uniqueness:{case_sensitive: true}
	validates :farm_area, presence: true
	validates :farm_address, presence: true,
									length: {maximum: 250}
	validates :farm_city, presence:true
	validates :farm_state, presence:true
	validates :soil_type, presence:true

	belongs_to :user

	has_many :soils, dependent: :destroy 

	has_many :crops, dependent: :destroy

	default_scope  { order(created_at: :desc) }

	def self.search(farm_id)
		farm = FarmDetail.find_by_id(farm_id)
		(farm) ? farm : nil
	end

	def self.create_csv_file(user,from_date,to_date)
		@farm_details = user.farm_details.where("created_at between ? and ?", from_date,to_date)
    	if !@farm_details.blank?
    		file_path = "#{Rails.root}/tmp/farm_report_#{user.id}.csv"
    		CSV.open(file_path, "w+") do |csv|
    			csv << ["Farm Name", "Farm Area", "Soil Type", "Description", "Farm Address", "Farm City", "Farm State"]
    			@farm_details.each do |farm|
      			csv << [farm.farm_name, farm.farm_area, farm.soil_type,farm.farm_description, farm.farm_address, farm.farm_city, farm.farm_state ]
      		end
      	end
      end
      (file_path) ? file_path : nil
	end

end

	    	
