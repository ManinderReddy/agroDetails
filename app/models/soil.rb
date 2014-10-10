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
end
