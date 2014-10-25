require 'test_helper'

class FertilizersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
