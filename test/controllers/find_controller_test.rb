require 'test_helper'

class FindControllerTest < ActionController::TestCase
  test "should get findApply" do
    get :findApply
    assert_response :success
  end

end
