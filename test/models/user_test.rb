require 'test_helper'

class UserTest < ActiveSupport::TestCase
  	
  	def setup
  		@user = User.new(name: "TestyUser", email: "test@test.com", password: "password",
  						 password_confirmation: "password")
  	end


	test "should be valid" do
		assert @user.valid?
	end

	test "name should be present" do
		@user.name = "   "
		assert_not @user.valid?
	end

	test "name should be withing max and min" do
		@user.name = "A"
		assert_not @user.valid?
		@user.name = "A"*51
		assert_not @user.valid?
	end


end
