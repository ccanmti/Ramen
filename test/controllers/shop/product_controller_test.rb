require "test_helper"

class Shop::ProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shop_product_index_url
    assert_response :success
  end

  test "should get show" do
    get shop_product_show_url
    assert_response :success
  end

  test "should get edit" do
    get shop_product_edit_url
    assert_response :success
  end

  test "should get update" do
    get shop_product_update_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_product_destroy_url
    assert_response :success
  end
end
