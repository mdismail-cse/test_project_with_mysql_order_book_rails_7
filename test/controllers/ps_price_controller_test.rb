require "test_helper"

class PsPriceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ps_price_index_url
    assert_response :success
  end

  test "should get create" do
    get ps_price_create_url
    assert_response :success
  end
end
