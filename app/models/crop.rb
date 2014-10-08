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

	belongs_to :farm_detail
end
