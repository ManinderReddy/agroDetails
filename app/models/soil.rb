# == Schema Information
#
# Table name: soils
#
#  id                 :integer          not null, primary key
#  soil_type          :string(255)
#  soil_texture       :string(255)
#  water_availability :string(255)
#  soil_ph            :string(255)
#  soil_biota         :string(255)
#  season             :string(255)
#  year_of_details    :integer
#  created_at         :datetime
#  updated_at         :datetime
#  farm_id            :integer
#

class Soil < ActiveRecord::Base
	attr_accessible :soil_type, :soil_texture, :water_availability,
						 :soil_ph, :soil_biota, :season, :year_of_details
end
