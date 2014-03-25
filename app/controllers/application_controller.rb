class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  ActsAsTaggableOn.delimiter = [' ',',']
  
  
  def sign_in_check
    if !current_user
      redirect_to signin_path
    end
  end
  
end
