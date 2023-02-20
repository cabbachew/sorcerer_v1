require "application_system_test_case"

class SourcesTest < ApplicationSystemTestCase
  setup do
    @source = Source.ordered.first
  end

  test "Creating a new source" do
    visit sources_path
    assert_selector "h1", text: "Sources"

    click_on "New source"
    fill_in "Name", with: "Test source"
    
    assert_selector "h1", text: "Sources"
    click_on "Create source"

    assert_selector "h1", text: "Sources"
    assert_text "Test source"
  end

  test "Showing a source" do
    visit sources_path
    click_link @source.name
    
    assert_selector "h1", text: @source.name
  end

  test "Updating a source" do
    visit sources_path
    assert_selector "h1", text: "Sources"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated source"
    
    assert_selector "h1", text: "Sources"
    click_on "Update source"

    assert_selector "h1", text: "Sources"
    assert_text "Updated source"
  end

  test "Destroying a source" do
    visit sources_path
    assert_text @source.name

    click_on "Delete", match: :first
    assert_no_text @source.name
  end
end
