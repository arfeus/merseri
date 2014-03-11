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
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @activity = Activity.first
    @activity .destroy
    redirect_to activities_url
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
