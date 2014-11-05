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

require 'test_helper'

class LookupFieldTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
