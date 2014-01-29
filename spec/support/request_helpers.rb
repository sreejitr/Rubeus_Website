module RequestHelpers
	#include Warden::Test::Helpers

  #This method attempts to create a signed in user with Warden because Devise test helpers
  # are not available for feature/request specs. However, it conflicts with transactional fixtures
  # and we do not wish to switch the entire testing framework over at this present juncture - BEG

  #def signin_user
		#Warden.test_mode!
		#user = FactoryGirl.create(:user)
		#login_as(user, :scope => :user)
		#user.confirmed_at = Time.now
		##user.save
  #
		#after(Warden.test_reset!)
  #end

  #This doesn't work because it doesn't have access to all of the Rails automagic.. like user_session_path
  # In order to DRY up our specs, we need to get this helper working... notice that it is copied/pasted
  # in all the feature/request specs that use it. :( -BEG
  def sign_in_with_valid_credentials
    visit user_session_path
    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button 'Sign in'
    expect(page).to have_content 'Signed in successfully'
  end
end