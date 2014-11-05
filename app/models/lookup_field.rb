# == Schema Information
#
# Table name: lookup_fields
#
#  id            :integer          not null, primary key
#  lookup_type   :string(255)
#  lookup_value  :string(255)
#  other_details :text
#  created_at    :datetime
#  updated_at    :datetime
#

class LookupField < ActiveRecord::Base
	attr_accessible :lookup_type, :lookup_value, :other_details

	validates :lookup_type, presence: true
	validates :lookup_value, presence: true

	def self.search(lookup_type)
		lookup_data = LookupField.where("lookup_type = ?", lookup_type)
		(lookup_data) ? lookup_data : nil
	end

end
