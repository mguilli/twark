require 'test_helper'

class TestpageControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
