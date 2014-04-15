class ActivitiesController < ApplicationController


  layout 'actions_layout'
  before_action :sign_in_check

  def new
    @activity = Activity.new
  end

  def edit
     @activity = Activity.find(params[:id])
  end

  def create
    @activity = current_user.activities.new(activity_params)
    if @activity.save
      redirect_to action_path, notice: 'Activity was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    @all_activities = Activity.where("user_id = ?", current_user.id)
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

  def on_frontpage  
    @activity = Activity.find(params[:id])
    if !@activity.active
      if @activity.update_attribute :active, true
        flash[:notice] = "Activity updated"
        redirect_to action_path
      end
    else
      if @activity.update_attribute :active, false
        flash[:notice] = "Activity updated"
      end
      redirect_to activities_path
    end
    @my_activities = current_user.activities.all
  end
  
  def action
    @active_activities = Activity.where("user_id = ? AND active = ?", current_user.id, true)
  end
  
  def history
    @actings_cu = Acting.where("user_id = ?", current_user.id).order('start DESC')
  end

  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def activity_params
      params.require(:activity).permit(:name, :user_id, :active)
    end
end
