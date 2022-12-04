require "test_helper"

class Shop::ShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shop_shops_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_shops_edit_url
    assert_response :success
  end

  test "should get update" do
    get shop_shops_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get shop_shops_unsubscribe_url
    assert_response :success
  end

  test "should get withdraw" do
    get shop_shops_withdraw_url
    assert_response :success
  end
end
