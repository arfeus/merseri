class PrintingController < ApplicationController
  
  layout 'notes_layout'
    
  def print_selected
    @mer = current_user
  end
    
  def print_all
    @mers = current_user.mers
  end
  
  def remove_collection
    session[:print] = Array.new
  end
  
  def print_collection
    if !session[:print]
      redirect_to remove_collection_path
    else
      @user = current_user
      @mers = Mer.order('vote DESC').find(session[:print])
    end
  end
  
  def collection_email
    @user = current_user
    @mers = Mer.order('vote DESC').find(session[:print])
    UserMailer.collection_email(@mers, @user).deliver
  end
end
