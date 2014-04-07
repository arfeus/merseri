class WelcomeController < ApplicationController

  
  def sign_in
    if !current_user
      redirect_to signin_path
    end
  end
  
  def help
  end
  
  def about
  end
  
  def contact
  end 
  
end
