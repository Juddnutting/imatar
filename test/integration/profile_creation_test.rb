require 'test_helper'

class ProfileCreationTest < ActionDispatch::IntegrationTest
  
	def setup
		@user = users(:judd)
	end

  test "Signup and create profile by uploading image" do
  	get new_user_registration_path
  	post user_session_path, 'user[email]' => @user.email, 'user[password]' =>  'password', 'user[password_confirmation' =>
                            'password', 'user[profile_attributes][name]' => 'joe smith'
  	follow_redirect!
    assert_template 'profiles/show'
  	@profile = @user.profile
  	@profile.image = sample_file
    @profile.save
  	assert @profile.image.exists?
  	assert_equal @user.profile.name, @profile.name 

  end
end
