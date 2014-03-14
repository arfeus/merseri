class ActivitiesController < ApplicationController

  def new
    @activity = Activity.new
  end

  def edit
     @activity = Activity.find(params[:id])
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to time_path, notice: 'Activity was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
      if @activity.update(activity_params)
        redirect_to activities_path, notice: 'Activity was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

  def my_act  
    @activity = Activity.find(params[:id])
    @activities = Activity.where("user_id = ? AND name = ?", current_user.id, @activity.name)
    if !@activities.any?
      @activity_cu = @activity.dup
      @activity_cu.user_id = current_user.id
      @activity_cu.save
    end
    @my_activities = Activity.where("user_id = ?", current_user.id) 
  end
  
  def time
    @my_activities = Activity.where("user_id = ?", current_user.id)
  end
  
  def history
    @actings_cu = Acting.where("user_id = ?", current_user.id)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :user_id)
    end
end
