require "application_system_test_case"

class SourcesTest < ApplicationSystemTestCase
  test "Creating a new source" do
    visit sources_path
    assert_selector "h1", text: "Sources"

    click_on "New Source"
    assert_selector "h1", text: "New Source"

    fill_in "Name", with: "Test Source"
    click_on "Create Source"

    assert_selector "h1", text: "Sources"
    assert_text "Test Source"
  end
end
