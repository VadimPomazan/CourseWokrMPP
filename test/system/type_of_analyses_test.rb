require "application_system_test_case"

class TypeOfAnalysesTest < ApplicationSystemTestCase
  setup do
    @type_of_analysis = type_of_analyses(:one)
  end

  test "visiting the index" do
    visit type_of_analyses_url
    assert_selector "h1", text: "Type of analyses"
  end

  test "should create type of analysis" do
    visit type_of_analyses_url
    click_on "New type of analysis"

    fill_in "Name", with: @type_of_analysis.name
    click_on "Create Type of analysis"

    assert_text "Type of analysis was successfully created"
    click_on "Back"
  end

  test "should update Type of analysis" do
    visit type_of_analysis_url(@type_of_analysis)
    click_on "Edit this type of analysis", match: :first

    fill_in "Name", with: @type_of_analysis.name
    click_on "Update Type of analysis"

    assert_text "Type of analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Type of analysis" do
    visit type_of_analysis_url(@type_of_analysis)
    click_on "Destroy this type of analysis", match: :first

    assert_text "Type of analysis was successfully destroyed"
  end
end
