class CommentsController < ApplicationController
  def create
    @mer = Mer.find(params[:mer_id])
    @comment = @mer.comments.create(comment_params)
    redirect_to mer_path(@mer)
  end
  
  def destroy
    @mer = Mer.find(params[:mer_id])
    @comment = @mer.comments.find(params[:id])
    @comment.destroy
    
    redirect_to mer_path(@mer)
  end
  
  private
   def comment_params
     params.require(:comment).permit(:commenter, :body)
   end
end
