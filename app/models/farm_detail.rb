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

	validates :user_id, presence: true
	validates :farm_name, presence: true,
								 uniqueness:{case_sensitive: true}
	validates :farm_area, presence: true
	validates :farm_address, presence: true,
									length: {maximum: 250}

	belongs_to :user

	has_many :soils

	has_many :crops

	attr_accessible :farm_area, :farm_address, :farm_description, :farm_name, :soil_type

	# default_scope order: "farm_details.created_at DESC"

	def self.search(farm_id)
		farm = FarmDetail.find_by_id(farm_id)
		(farm) ? farm : nil
	end


end
