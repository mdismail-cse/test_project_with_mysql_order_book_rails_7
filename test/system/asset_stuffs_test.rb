require "application_system_test_case"

class AssetStuffsTest < ApplicationSystemTestCase
  setup do
    @asset_stuff = asset_stuffs(:one)
  end

  test "visiting the index" do
    visit asset_stuffs_url
    assert_selector "h1", text: "Asset stuffs"
  end

  test "should create asset stuff" do
    visit asset_stuffs_url
    click_on "New asset stuff"

    fill_in "Assign at", with: @asset_stuff.assign_at
    fill_in "Company asset", with: @asset_stuff.company_asset_id
    fill_in "Return at", with: @asset_stuff.return_at
    fill_in "Status", with: @asset_stuff.status
    fill_in "Stuff", with: @asset_stuff.stuff_id
    click_on "Create Asset stuff"

    assert_text "Asset stuff was successfully created"
    click_on "Back"
  end

  test "should update Asset stuff" do
    visit asset_stuff_url(@asset_stuff)
    click_on "Edit this asset stuff", match: :first

    fill_in "Assign at", with: @asset_stuff.assign_at
    fill_in "Company asset", with: @asset_stuff.company_asset_id
    fill_in "Return at", with: @asset_stuff.return_at
    fill_in "Status", with: @asset_stuff.status
    fill_in "Stuff", with: @asset_stuff.stuff_id
    click_on "Update Asset stuff"

    assert_text "Asset stuff was successfully updated"
    click_on "Back"
  end

  test "should destroy Asset stuff" do
    visit asset_stuff_url(@asset_stuff)
    click_on "Destroy this asset stuff", match: :first

    assert_text "Asset stuff was successfully destroyed"
  end
end
