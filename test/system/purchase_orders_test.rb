require "application_system_test_case"

class PurchaseOrdersTest < ApplicationSystemTestCase
  setup do
    @purchase_order = purchase_orders(:one)
  end

  test "visiting the index" do
    visit purchase_orders_url
    assert_selector "h1", text: "Purchase orders"
  end

  test "should create purchase order" do
    visit purchase_orders_url
    click_on "New purchase order"

    fill_in "Total price", with: @purchase_order.total_price
    click_on "Create Purchase order"

    assert_text "Purchase order was successfully created"
    click_on "Back"
  end

  test "should update Purchase order" do
    visit purchase_order_url(@purchase_order)
    click_on "Edit this purchase order", match: :first

    fill_in "Total price", with: @purchase_order.total_price
    click_on "Update Purchase order"

    assert_text "Purchase order was successfully updated"
    click_on "Back"
  end

  test "should destroy Purchase order" do
    visit purchase_order_url(@purchase_order)
    click_on "Destroy this purchase order", match: :first

    assert_text "Purchase order was successfully destroyed"
  end
end
