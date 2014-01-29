# This gives one class to configure things such as request forgery protection
# and filtering of sensitive request parameters
class ApplicationController < ActionController::Base
  protect_from_forgery #It protects from csrf. e.g. all POST requests should have specific security token

  #Global function for getting current logged in user
  def get_user_id
    if user_signed_in?
      @user_id = current_user.id
    end
  end
end

