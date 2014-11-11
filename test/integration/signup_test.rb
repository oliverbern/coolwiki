require 'test_helper'

require 'capybara/rails'

class SignUpTest < ActionDispatch::IntegrationTest
	
	include Capybara::DSL
	
	test "Sign Up" do
		
		visit "/users/sign_up"
		
		assert page.has_content?("Password")
	end
end
