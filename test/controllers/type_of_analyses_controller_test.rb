require "test_helper"

class TypeOfAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_analysis = type_of_analyses(:one)
  end

  test "should get index" do
    get type_of_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_analysis_url
    assert_response :success
  end

  test "should create type_of_analysis" do
    assert_difference("TypeOfAnalysis.count") do
      post type_of_analyses_url, params: { type_of_analysis: { name: @type_of_analysis.name } }
    end

    assert_redirected_to type_of_analysis_url(TypeOfAnalysis.last)
  end

  test "should show type_of_analysis" do
    get type_of_analysis_url(@type_of_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_analysis_url(@type_of_analysis)
    assert_response :success
  end

  test "should update type_of_analysis" do
    patch type_of_analysis_url(@type_of_analysis), params: { type_of_analysis: { name: @type_of_analysis.name } }
    assert_redirected_to type_of_analysis_url(@type_of_analysis)
  end

  test "should destroy type_of_analysis" do
    assert_difference("TypeOfAnalysis.count", -1) do
      delete type_of_analysis_url(@type_of_analysis)
    end

    assert_redirected_to type_of_analyses_url
  end
end
