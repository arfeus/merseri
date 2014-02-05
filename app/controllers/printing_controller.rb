class PrintingController < ApplicationController
  def print_selected
    @mer = current_user
  end
  
  
  def print_all
    @mers = current_user.mers
  end
  
  def add_collection
    @mer_added = Mer.find(params[:id])
    session[:print] = Array.new unless session[:print]
    session[:print].push(@mer_added.id)
  end
  
  def print_collection
    if !session[:print]
      redirect_to remove_collection_path
    else
    @mers = Mer.order('vote DESC').find(session[:print])
  end
  end
  
  def remove_collection
    session[:print] = Array.new
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
