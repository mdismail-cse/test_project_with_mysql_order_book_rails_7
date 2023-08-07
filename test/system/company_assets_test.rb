require "application_system_test_case"

class CompanyAssetsTest < ApplicationSystemTestCase
  setup do
    @company_asset = company_assets(:one)
  end

  test "visiting the index" do
    visit company_assets_url
    assert_selector "h1", text: "Company assets"
  end

  test "should create company asset" do
    visit company_assets_url
    click_on "New company asset"

    fill_in "Asset type", with: @company_asset.asset_type_id
    fill_in "Details", with: @company_asset.details
    fill_in "Name", with: @company_asset.name
    fill_in "Product address", with: @company_asset.product_address
    click_on "Create Company asset"

    assert_text "Company asset was successfully created"
    click_on "Back"
  end

  test "should update Company asset" do
    visit company_asset_url(@company_asset)
    click_on "Edit this company asset", match: :first

    fill_in "Asset type", with: @company_asset.asset_type_id
    fill_in "Details", with: @company_asset.details
    fill_in "Name", with: @company_asset.name
    fill_in "Product address", with: @company_asset.product_address
    click_on "Update Company asset"

    assert_text "Company asset was successfully updated"
    click_on "Back"
  end

  test "should destroy Company asset" do
    visit company_asset_url(@company_asset)
    click_on "Destroy this company asset", match: :first

    assert_text "Company asset was successfully destroyed"
  end
end
