require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	
	test "preview" do
		@wiki = wikis(:one)
		expect = @wiki.preview
		assert_equal "MyString MyText" #, expect
	end
	
	test "user_id" do
		expect = Wiki.new
		assert @wiki.user_id == 2
	end
	
end
