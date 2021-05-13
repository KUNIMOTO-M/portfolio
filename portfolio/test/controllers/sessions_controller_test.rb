require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest

	def setup
		@user = users(:one)
	end
	


  test "should redirect no login user" do
		delete logout_path
		assert_redirected_to login_url
  end

	
end
