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

require 'test_helper'

class FertilizerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
