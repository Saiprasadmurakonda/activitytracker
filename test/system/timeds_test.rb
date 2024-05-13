require "application_system_test_case"

class TimedsTest < ApplicationSystemTestCase
  setup do
    @timed = timeds(:one)
  end

  test "visiting the index" do
    visit timeds_url
    assert_selector "h1", text: "Timeds"
  end

  test "should create timed" do
    visit timeds_url
    click_on "New timed"

    fill_in "Timed site", with: @timed.timed_site
    fill_in "Timeinmin", with: @timed.timeinmin
    click_on "Create Timed"

    assert_text "Timed was successfully created"
    click_on "Back"
  end

  test "should update Timed" do
    visit timed_url(@timed)
    click_on "Edit this timed", match: :first

    fill_in "Timed site", with: @timed.timed_site
    fill_in "Timeinmin", with: @timed.timeinmin
    click_on "Update Timed"

    assert_text "Timed was successfully updated"
    click_on "Back"
  end

  test "should destroy Timed" do
    visit timed_url(@timed)
    click_on "Destroy this timed", match: :first

    assert_text "Timed was successfully destroyed"
  end
end
