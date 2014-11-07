require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	
	
	test "admin" do
		@user = users(:one)
		assert_equal "user", @user.role #also possible to write assert "admin"?
	end
	
	test "email length" do
		@user = users(:one)
		expect = @user.email.length
		assert 14 #why not >1 or >10
	end
	
	test "default role" do
		@user = User.new
		expect = @user.role
		assert_equal "user" , expect
	end
	
end
