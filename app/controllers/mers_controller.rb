class MersController < ApplicationController

  layout 'notes_layout'
  before_action :sign_in_check
  
  def new
    @mer = Mer.new
  end
  
  def create 
    @mer = current_user.mers.new(mer_params)
    if mer_params[:title] == "" then
      @mer.text = @mer.text.sub("---",'')
      @input = @mer.text.split("_")
      @mer.title = @input[0]
      @mer.tag_list = @input[1]
      @mer.text = @input[2]
      if @mer.save
        redirect_to @mer
      else
        render 'new'
      end  
    else
      if @mer.vote == nil
        @mer.vote = 0
      end
      if @mer.save
         redirect_to @mer
      else
         render 'new'
      end
    end
  end
  
  
  
  
  def show
    @mer = Mer.find(params[:id])
    @user = User.find(@mer.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mer }
    end
  end
  
  def index    
    if params[:search] && current_user.admin?
      @mers = Mer.all.search(params[:search]).order('vote DESC')
    elsif params[:tag] && current_user.admin?
      @mers = Mer.all.tagged_with(params[:tag])
    elsif params[:search]
      @mers = current_user.mers.search(params[:search]).order('vote DESC')
    elsif params[:tag]
      @mers = current_user.mers.tagged_with(params[:tag])
    elsif
      @mers = current_user.mers
    end
  end
    
  def edit
    @mer = Mer.find(params[:id])
  end
  
  def update
    @mer = Mer.find(params[:id])    
    if @mer.update(mer_params)
      redirect_to @mer
    else
      render 'edit'
    end
  end  
  
  def destroy
    @mer = Mer.find(params[:id])
    @mer.destroy
    session[:print].delete_if {|item| item == @mer.id }   
    redirect_to root_path
  end
  
  def vote_up
    @mer = Mer.find(params[:id])
    @mer.vote = @mer.vote + 1
    @mer.update_attribute(:vote, @mer.vote)
    redirect_to :back
  end
  
  def vote_down
    @mer = Mer.find(params[:id])
    if @mer.vote > 0
      @mer.vote = @mer.vote - 1
      @mer.update_attribute(:vote, @mer.vote)
    end
    redirect_to :back
  end
  
  def add_collection
    @mer = Mer.find(params[:id])
    session[:print] = Array.new unless session[:print]
    session[:print].push(@mer.id)
  end
  
  def remove_this_collection
    @mer = Mer.find(params[:id])
    session[:print].delete(@mer.id)
    redirect_to print_collection_path
  end
  
  def search
  end
  
  private
    def mer_params
      params.require(:mer).permit(:title, :text, :vote, :tag_list, :search)
    end   
end
