class CommentsController < ApplicationController
  def create
    @mer = current_user.mers.find(params[:mer_id])
    @comment = @mer.comments.create(comment_params)
    redirect_to mer_path(@mer)
  end
  
  def destroy
    @mer = current_user.mers.find(params[:mer_id])
    @comment = @mer.comments.find(params[:id])
    @comment.destroy
    
    redirect_to mer_path(@mer)
  end
  
  private
   def comment_params
     params.require(:comment).permit(:commenter, :body)
   end
end
