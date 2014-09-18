# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  first_name         :string(255)
#  last_name          :string(255)
#  age                :integer
#  phone_no           :integer
#  email              :string(255)
#  address            :string(255)
#  city               :string(255)
#  state              :string(255)
#  country            :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
