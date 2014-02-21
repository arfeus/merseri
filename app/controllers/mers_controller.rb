class MersController < ApplicationController

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
       if @mer.save
         redirect_to @mer
       else
         render 'new'
       end
    end
  end
  
  def show
    @mer = Mer.find(params[:id])
  end
  
  def index    
    if params[:search]
      @mers = current_user.mers.search(params[:search]).order('vote DESC')
    elsif params[:tag]
      @mers = current_user.mers.tagged_with(params[:tag])
    else
      if current_user.admin?
        @mers = Mer.all.order('vote DESC')
      else
      @mers = current_user.mers.order('vote DESC')
      end
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
    redirect_to mers_path
  end
  
  def vote_up
    @mer = Mer.find(params[:id])
    @mer.vote = @mer.vote + 1
    @mer.update_attribute(:vote, @mer.vote)
    render 'show'
  end
  
  def vote_down
    @mer = Mer.find(params[:id])
    if @mer.vote >= 0
      @mer.vote = @mer.vote - 1
      @mer.update_attribute(:vote, @mer.vote)
    end
    redirect_to mers_path
  end
  
  private
    def mer_params
      params.require(:mer).permit(:title, :text, :vote, :tag_list, :search)
    end   
end
