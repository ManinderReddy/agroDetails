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

require 'test_helper'

class FarmDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
