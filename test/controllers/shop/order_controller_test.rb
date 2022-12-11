require "test_helper"

class Shop::OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_order_index_url
    assert_response :success
  end
end
