require "test_helper"

class AssetTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset_type = asset_types(:one)
  end

  test "should get index" do
    get asset_types_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_type_url
    assert_response :success
  end

  test "should create asset_type" do
    assert_difference("AssetType.count") do
      post asset_types_url, params: { asset_type: { product_catagory: @asset_type.product_catagory } }
    end

    assert_redirected_to asset_type_url(AssetType.last)
  end

  test "should show asset_type" do
    get asset_type_url(@asset_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_asset_type_url(@asset_type)
    assert_response :success
  end

  test "should update asset_type" do
    patch asset_type_url(@asset_type), params: { asset_type: { product_catagory: @asset_type.product_catagory } }
    assert_redirected_to asset_type_url(@asset_type)
  end

  test "should destroy asset_type" do
    assert_difference("AssetType.count", -1) do
      delete asset_type_url(@asset_type)
    end

    assert_redirected_to asset_types_url
  end
end
