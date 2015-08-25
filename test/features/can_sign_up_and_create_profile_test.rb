require "test_helper"

class CanSignUpAndCreateProfileTest < Capybara::Rails::TestCase
 

  test "user can singup and profile is created" do
    visit new_user_registration_path
    email_exists = page.has_field?('user_email')
    assert_equal true, email_exists
    fill_in('Email', :with => 'test@example.com')
    fill_in('Password', :with => 'password')
   # fill_in('Password Confirmation', :with => 'password')
    fill_in('Name', :with => 'User1')
    click_link('Sign Up')


    # expect(page).to have_content('signed up sucessfully')

	# page.status_code  == 200
	current_path.should == profile_path	
    # assert_content page, "test@example.com"
  end
end
