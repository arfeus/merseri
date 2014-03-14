class ActivityTimesController < ApplicationController
   
  def create   
    @activity = Activity.find(params[:activity_id])
    @activity.activity_times.create(start: DateTime.now, stop: DateTime.now)
      redirect_to ongoing_activity_path(@activity), notice: 'Activity is started.'
  end
  
  def update
    @activity = Activity.find(params[:activity_id])
    @activity_time = @activity.activity_times.find(params[:id])
    @activity_time.update(stop: DateTime.now)
      redirect_to welcome_path, notice: 'Activity is finished.'
  end
  
  def destroy
    @activity = Activity.find(params[:activity_id])
    @activity_time = @activity.activity_times.find(params[:id])
    @activity_time.destroy
      redirect_to welcome_path, notice: 'Activity_time is deleted.'
  end
  
  private

    def activity_time_params
      params.require(:activity_time).permit(:start, :stop, :activity_id)
    end
    
end
