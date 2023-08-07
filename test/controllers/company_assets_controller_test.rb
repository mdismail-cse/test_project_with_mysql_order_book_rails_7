require "test_helper"

class CompanyAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_asset = company_assets(:one)
  end

  test "should get index" do
    get company_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_company_asset_url
    assert_response :success
  end

  test "should create company_asset" do
    assert_difference("CompanyAsset.count") do
      post company_assets_url, params: { company_asset: { asset_type_id: @company_asset.asset_type_id, details: @company_asset.details, name: @company_asset.name, product_address: @company_asset.product_address } }
    end

    assert_redirected_to company_asset_url(CompanyAsset.last)
  end

  test "should show company_asset" do
    get company_asset_url(@company_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_asset_url(@company_asset)
    assert_response :success
  end

  test "should update company_asset" do
    patch company_asset_url(@company_asset), params: { company_asset: { asset_type_id: @company_asset.asset_type_id, details: @company_asset.details, name: @company_asset.name, product_address: @company_asset.product_address } }
    assert_redirected_to company_asset_url(@company_asset)
  end

  test "should destroy company_asset" do
    assert_difference("CompanyAsset.count", -1) do
      delete company_asset_url(@company_asset)
    end

    assert_redirected_to company_assets_url
  end
end
