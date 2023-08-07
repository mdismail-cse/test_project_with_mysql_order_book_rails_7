require "application_system_test_case"

class AssetTypesTest < ApplicationSystemTestCase
  setup do
    @asset_type = asset_types(:one)
  end

  test "visiting the index" do
    visit asset_types_url
    assert_selector "h1", text: "Asset types"
  end

  test "should create asset type" do
    visit asset_types_url
    click_on "New asset type"

    fill_in "Product catagory", with: @asset_type.product_catagory
    click_on "Create Asset type"

    assert_text "Asset type was successfully created"
    click_on "Back"
  end

  test "should update Asset type" do
    visit asset_type_url(@asset_type)
    click_on "Edit this asset type", match: :first

    fill_in "Product catagory", with: @asset_type.product_catagory
    click_on "Update Asset type"

    assert_text "Asset type was successfully updated"
    click_on "Back"
  end

  test "should destroy Asset type" do
    visit asset_type_url(@asset_type)
    click_on "Destroy this asset type", match: :first

    assert_text "Asset type was successfully destroyed"
  end
end
