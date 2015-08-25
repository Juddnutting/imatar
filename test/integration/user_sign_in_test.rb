require 'test_helper'

class UserSignInTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:user1)
  end

  test "log in and out with valid information" do
  	get new_user_session_path
  	post user_session_path, 'user[email]' => @user.email, 'user[password]' =>  'password'
  	follow_redirect!
    assert_response :success
  	assert_select "a[href=?]", user_session_path, count: 0
  	assert_select "a[href=?]", destroy_user_session_path
  	assert_select "a[href=?]", edit_user_registration_path
  	delete destroy_user_session_path
  	assert_not flash.empty?
  	follow_redirect!
  	assert_select "a[href=?]", user_session_path
  	assert_select "a[href=?]", destroy_user_session_path, count: 0
  	assert_select "a[href=?]", edit_user_registration_path, count: 0
	end

	test "log in with invalid info" do
		get new_user_session_path
		assert_template 'devise/sessions/new'
		post user_session_path, 'user[email]' => " ", 'user[password]' =>  ""
		assert_template 'devise/sessions/new'
		assert_not flash.empty?
    get root_path
    assert flash.empty?
  
	end


end
