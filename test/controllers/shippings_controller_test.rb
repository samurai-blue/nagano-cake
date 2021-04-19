require 'test_helper'

class ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shippings_create_url
    assert_response :success
  end

  test "should get index" do
    get shippings_index_url
    assert_response :success
  end

  test "should get destroy" do
    get shippings_destroy_url
    assert_response :success
  end

  test "should get update" do
    get shippings_update_url
    assert_response :success
  end

  test "should get edit" do
    get shippings_edit_url
    assert_response :success
  end

end
