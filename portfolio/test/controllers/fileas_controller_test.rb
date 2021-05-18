require "test_helper"

class FileasControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get fileas_create_url
    assert_response :success
  end

  test "should get destroy" do
    get fileas_destroy_url
    assert_response :success
  end
end
