require 'test_helper'

class CollegeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get college_index_url
    assert_response :success
  end

end
