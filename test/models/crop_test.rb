# == Schema Information
#
# Table name: crops
#
#  id             :integer          not null, primary key
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
#  farm_detail_id :integer
#

require 'test_helper'

class CropTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
