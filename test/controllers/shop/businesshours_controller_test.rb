require "test_helper"

class Shop::BusinesshoursControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shop_businesshours_create_url
    assert_response :success
  end
end
