require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
	
	test "should show signup page" do
		get sign_up_path
		assert_response :success
	end
end
