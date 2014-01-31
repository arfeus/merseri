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
    @mer = current_user.mers.find(params[:id])
  end
  
  def index
    
    if params[:search]
      @mers = current_user.mers.search(params[:search]).order('vote DESC')
    elsif params[:tag]
      @mers = current_user.mers.tagged_with(params[:tag])
    else
      @mers = current_user.mers.order('vote DESC')
    end
  end
  
  def edit
    @mer = Mer.find(params[:id])
  end
  
  def update
    @mer = Mer.find(params[:id])
    
    if @mer.update(mer_params)
      if params[:commit] == 'Vote'
         redirect_to mers_path
      else redirect_to @mer
      end
    else
      render 'edit'
    end
  end
  
  
  def destroy
    @mer = Mer.find(params[:id])
    @mer.destroy
    
    redirect_to mers_path
  end
  
  private
    def mer_params
      params.require(:mer).permit(:title, :text, :vote, :tag_list, :search)
    end   

end
