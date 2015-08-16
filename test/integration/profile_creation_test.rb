require 'test_helper'

class ProfileCreationTest < ActionDispatch::IntegrationTest
  
	def setup
		@user = users(:judd)
	end

  test "login, create profile by uploading image" do
  	get new_user_session_path
  	post user_session_path, 'user[email]' => @user.email, 'user[password]' =>  'password'
  	follow_redirect!
  	get new_profile_path
  	assert_template 'profiles/new'
  	@profile = @user.build_profile
  	@profile.image = sample_file
  	assert @profile.image.exists?
  	assert_equal @user.name, @profile.user.name 

  end
end
