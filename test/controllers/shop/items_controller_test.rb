require "test_helper"

class Shop::ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_items_index_url
    assert_response :success
  end
end
