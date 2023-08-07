require "test_helper"

class AssetStuffsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asset_stuff = asset_stuffs(:one)
  end

  test "should get index" do
    get asset_stuffs_url
    assert_response :success
  end

  test "should get new" do
    get new_asset_stuff_url
    assert_response :success
  end

  test "should create asset_stuff" do
    assert_difference("AssetStuff.count") do
      post asset_stuffs_url, params: { asset_stuff: { assign_at: @asset_stuff.assign_at, company_asset_id: @asset_stuff.company_asset_id, return_at: @asset_stuff.return_at, status: @asset_stuff.status, stuff_id: @asset_stuff.stuff_id } }
    end

    assert_redirected_to asset_stuff_url(AssetStuff.last)
  end

  test "should show asset_stuff" do
    get asset_stuff_url(@asset_stuff)
    assert_response :success
  end

  test "should get edit" do
    get edit_asset_stuff_url(@asset_stuff)
    assert_response :success
  end

  test "should update asset_stuff" do
    patch asset_stuff_url(@asset_stuff), params: { asset_stuff: { assign_at: @asset_stuff.assign_at, company_asset_id: @asset_stuff.company_asset_id, return_at: @asset_stuff.return_at, status: @asset_stuff.status, stuff_id: @asset_stuff.stuff_id } }
    assert_redirected_to asset_stuff_url(@asset_stuff)
  end

  test "should destroy asset_stuff" do
    assert_difference("AssetStuff.count", -1) do
      delete asset_stuff_url(@asset_stuff)
    end

    assert_redirected_to asset_stuffs_url
  end
end
