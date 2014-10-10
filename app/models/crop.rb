# == Schema Information
#
# Table name: crops
#
#  id             :integer          not null, primary key
#  farm_id        :integer
#  crop_name      :string(255)
#  crop_acarage   :integer
#  season         :string(255)
#  from_date      :date
#  to_date        :date
#  expected_yeild :integer
#  actual_yeild   :integer
#  Other_details  :text
#  created_at     :datetime
#  updated_at     :datetime
#

class Crop < ActiveRecord::Base
	

	attr_accessible :crop_name, :crop_acarage, :season, :from_date, :to_date,
						:expected_yeild, :actual_yeild, :Other_details

	validates	:crop_name, presence: true
	validates	:crop_acarage,presence: true,
					 numericality: { only_integer: true, greater_than: 0 }
	validate		:crop_acarage_greater_than_farm_area, on: [:create]
	validate    :crop_acarage_greater_than_farm_area_update, on: [:update]
	validates	:season, presence: true
	validates	:from_date, presence: true
	validates	:to_date, presence: true
	validate 	:to_date_greater_than_from_date, on:[:create, :update]
	validates	:expected_yeild, presence: true

	belongs_to :farm_detail

	default_scope  { order(created_at: :desc) }
	
	def available_crop_area(farm)
		@crops = farm.crops.where("to_date >= ?", Date.today)
		if @crops.blank?
			available_crop_area = farm.farm_area
		else
			crop_area = 0
			for crop in @crops
				crop_area += crop.crop_acarage
			end
			farm_area = farm.farm_area
			if crop_area == 0
				available_crop_area = farm_area
			else
				available_crop_area = farm_area - crop_area
			end
		end	
	end

private
	def crop_acarage_greater_than_farm_area
		if crop_acarage.present? && crop_acarage > available_crop_area(self.farm_detail)
     		errors.add(:crop_acarage, "greater than available farm area")
    	end
  	end

  	def crop_acarage_greater_than_farm_area_update
    	if crop_acarage >	(available_crop_area(self.farm_detail) + self.crop_acarage_was)
     		errors.add(:crop_acarage, "greater than available farm area")
    	end
  	end

  	def to_date_greater_than_from_date
  		if to_date.present? && to_date <= from_date
  			errors.add(:to_date, "should be grater than From date")
  		end
  	end
end
