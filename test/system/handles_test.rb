require "application_system_test_case"

class HandlesTest < ApplicationSystemTestCase
  setup do
    @handle = handles(:one)
  end

  test "visiting the index" do
    visit handles_url
    assert_selector "h1", text: "Handles"
  end

  test "should create handle" do
    visit handles_url
    click_on "New handle"

    fill_in "Email", with: @handle.email
    fill_in "Login", with: @handle.login
    fill_in "Name", with: @handle.name
    click_on "Create Handle"

    assert_text "Handle was successfully created"
    click_on "Back"
  end

  test "should update Handle" do
    visit handle_url(@handle)
    click_on "Edit this handle", match: :first

    fill_in "Email", with: @handle.email
    fill_in "Login", with: @handle.login
    fill_in "Name", with: @handle.name
    click_on "Update Handle"

    assert_text "Handle was successfully updated"
    click_on "Back"
  end

  test "should destroy Handle" do
    visit handle_url(@handle)
    click_on "Destroy this handle", match: :first

    assert_text "Handle was successfully destroyed"
  end
end
