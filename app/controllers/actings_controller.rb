class ActingsController < ApplicationController

 before_action :on_activity, only: :new
 
  def new
    @acting = Acting.new
  end

  def edit
    @acting = Acting.find(params[:id])
  end

  def create
    @acting = current_user.actings.new(acting_params)    
    if @acting.save
      redirect_to actings_path, notice: 'Acting was successfully created.'
    else
      render action: 'new' 
    end
  end
  

  def index
    @actings = Acting.all
  end

  def show
    @acting = Acting.find(params[:id])
    @activity = Activity.find(@acting.activity_id)
  end

  def update
    @acting = Acting.find(params[:id])
    @activity = Activity.find(@acting.activity_id)
    @acting.stop = Time.now
    if @acting.save
      @acting.stop = Time.now
    else
      render action: 'edit'
    end
  end

  def destroy
    @acting = Acting.find(params[:id])
    @acting.destroy
    redirect_to actings_path
  end
  
  def on_acting
    @actings = Acting.where("user_id = ? ", current_user.id)
    @on_actings = Array.new
    @actings.each do |a|
      if a.start == a.stop
        @on_actings.push(a)
      end
    end
  end

  private
  
  def on_activity
    @activity = Activity.find(params[:activity_id])
    @actings = Acting.where("user_id = ? AND activity_id = ?", current_user.id, @activity.id)
    @on_actings = Array.new
    @actings.each do |a|
      if a.start == a.stop
        @on_actings.push(a)
        render 'on_acting'
      end
    end
  end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_acting
      @acting = Acting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acting_params
      params.require(:acting).permit(:user_id, :activity_id, :start, :stop)
    end
end
