# == Schema Information
#
# Table name: fertilizers
#
#  id                   :integer          not null, primary key
#  crop_id              :integer
#  fertilizer_name      :string(255)
#  fertilizer_added_on  :date
#  amount_of_fertilizer :integer
#  other_details        :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#

class Fertilizer < ActiveRecord::Base

	attr_accessible :fertilizer_name, :fertilizer_added_on, :amount_of_fertilizer, :other_details

	validates :fertilizer_name, presence: true
	validates :fertilizer_added_on, presence:true
	validates :amount_of_fertilizer, presence:true,
				 numericality: { only_integer: true, greater_than: 0 }

	belongs_to :crop

end
