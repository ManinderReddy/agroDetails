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
#

class FarmDetail < ActiveRecord::Base

	validates :user_id, presence: true
	validates :farm_area, presence: true
	validates :farm_address, presence: true,
									length: {maximum: 250}

	belongs_to :user

	has_many :soils

	attr_accessible :farm_area, :farm_address, :farm_description

	# default_scope order: "farm_details.created_at DESC"

	def self.fetch_farm(farm_id)
		farm = FarmDetail.find_by_id(farm_id)
		(farm) ? farm : nil
	end


end
