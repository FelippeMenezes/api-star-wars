require "test_helper"

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vehicles_index_url
    assert_response :success
  end
end
