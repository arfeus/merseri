class PrintingController < ApplicationController
  def print_selected
    @mer = current_user
  end
  
  
  def print_all
    @mers = current_user.mers
  end
  
  def add_collection
    @collection = current_user.mers.find(params[:id])
  end
  
  def print_collection
  end
  
  def adminon
    current_user.update_attribute :admin, true
    redirect_to root_path
  end
  
  def adminoff
    current_user.update_attribute :admin, false
    redirect_to root_path
  end

end
