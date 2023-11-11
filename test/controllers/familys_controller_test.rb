require "test_helper"

class FamilysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get familys_index_url
    assert_response :success
  end
end
